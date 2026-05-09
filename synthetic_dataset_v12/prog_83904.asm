; DESCRIPTION: Creates a green rectangular region at (385, 78) spanning 37 by 35 pixels.
; PLAN: r0=385(x), r1=78(y), r2=37(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 78
LDI r2, 37
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
