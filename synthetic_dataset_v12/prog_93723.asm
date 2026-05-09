; DESCRIPTION: Draws a purple circle centered at (112, 27) with radius 20.
; PLAN: r0=112(x), r1=27(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 27
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
