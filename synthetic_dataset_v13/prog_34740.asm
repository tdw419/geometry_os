; DESCRIPTION: Draws a yellow circle centered at (51, 148) with radius 46.
; PLAN: r0=51(x), r1=148(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 148
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
