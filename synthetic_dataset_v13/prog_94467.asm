; DESCRIPTION: Creates a cyan rectangular region at (61, 104) spanning 30 by 45 pixels.
; PLAN: r0=61(x), r1=104(y), r2=30(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 104
LDI r2, 30
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
