; DESCRIPTION: Draws a yellow circle centered at (461, 174) with radius 48.
; PLAN: r0=461(x), r1=174(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 174
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
