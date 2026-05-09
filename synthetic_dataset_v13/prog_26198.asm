; DESCRIPTION: Draws a blue circle centered at (77, 27) with radius 22.
; PLAN: r0=77(x), r1=27(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 27
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
