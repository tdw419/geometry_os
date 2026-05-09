; DESCRIPTION: Draws a yellow circle centered at (138, 237) with radius 18.
; PLAN: r0=138(x), r1=237(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 237
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
