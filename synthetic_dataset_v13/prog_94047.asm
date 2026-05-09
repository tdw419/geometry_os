; DESCRIPTION: Creates a green rectangular region at (402, 35) spanning 36 by 78 pixels.
; PLAN: r0=402(x), r1=35(y), r2=36(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 35
LDI r2, 36
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
