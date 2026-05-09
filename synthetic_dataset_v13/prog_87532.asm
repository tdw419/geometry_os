; DESCRIPTION: Creates a green rectangular region at (37, 19) spanning 31 by 117 pixels.
; PLAN: r0=37(x), r1=19(y), r2=31(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 19
LDI r2, 31
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
