; DESCRIPTION: Draws a purple circle centered at (36, 210) with radius 36.
; PLAN: r0=36(x), r1=210(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 210
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
