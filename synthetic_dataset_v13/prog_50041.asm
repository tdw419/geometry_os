; DESCRIPTION: Draws a yellow circle centered at (270, 109) with radius 79.
; PLAN: r0=270(x), r1=109(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 109
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
