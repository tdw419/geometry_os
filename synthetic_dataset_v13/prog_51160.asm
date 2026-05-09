; DESCRIPTION: Draws a yellow circle centered at (441, 136) with radius 16.
; PLAN: r0=441(x), r1=136(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 136
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
