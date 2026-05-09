; DESCRIPTION: Draws a yellow circle centered at (236, 159) with radius 79.
; PLAN: r0=236(x), r1=159(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 159
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
