; DESCRIPTION: Draws a yellow circle centered at (366, 159) with radius 79.
; PLAN: r0=366(x), r1=159(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 159
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
