; DESCRIPTION: Creates a green rectangular region at (270, 110) spanning 38 by 15 pixels.
; PLAN: r0=270(x), r1=110(y), r2=38(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 110
LDI r2, 38
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
