; DESCRIPTION: Creates a cyan rectangular region at (297, 104) spanning 49 by 100 pixels.
; PLAN: r0=297(x), r1=104(y), r2=49(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 104
LDI r2, 49
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
