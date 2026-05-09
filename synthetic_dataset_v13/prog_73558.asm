; DESCRIPTION: Draws a green circle centered at (391, 79) with radius 41.
; PLAN: r0=391(x), r1=79(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 79
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
