; DESCRIPTION: Draws a purple circle centered at (470, 100) with radius 18.
; PLAN: r0=470(x), r1=100(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 100
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
