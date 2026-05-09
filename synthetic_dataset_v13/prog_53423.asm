; DESCRIPTION: Draws a green circle centered at (362, 119) with radius 34.
; PLAN: r0=362(x), r1=119(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 119
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
