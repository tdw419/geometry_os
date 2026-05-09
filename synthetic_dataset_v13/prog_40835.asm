; DESCRIPTION: Draws a purple circle centered at (52, 47) with radius 18.
; PLAN: r0=52(x), r1=47(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 47
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
