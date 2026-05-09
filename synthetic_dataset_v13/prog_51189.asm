; DESCRIPTION: Draws a yellow circle centered at (441, 174) with radius 21.
; PLAN: r0=441(x), r1=174(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 174
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
