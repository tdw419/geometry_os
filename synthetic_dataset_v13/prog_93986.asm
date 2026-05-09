; DESCRIPTION: Draws a yellow circle centered at (391, 159) with radius 80.
; PLAN: r0=391(x), r1=159(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 159
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
