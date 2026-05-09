; DESCRIPTION: Creates a cyan rectangular region at (21, 83) spanning 104 by 120 pixels.
; PLAN: r0=21(x), r1=83(y), r2=104(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 83
LDI r2, 104
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
