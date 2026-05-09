; DESCRIPTION: Draws a yellow circle centered at (204, 187) with radius 63.
; PLAN: r0=204(x), r1=187(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 187
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
