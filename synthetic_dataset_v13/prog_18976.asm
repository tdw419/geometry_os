; DESCRIPTION: Draws a yellow circle centered at (293, 121) with radius 44.
; PLAN: r0=293(x), r1=121(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 121
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
