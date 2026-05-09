; DESCRIPTION: Draws a blue circle centered at (432, 62) with radius 27.
; PLAN: r0=432(x), r1=62(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 62
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
