; DESCRIPTION: Draws a green circle centered at (362, 178) with radius 23.
; PLAN: r0=362(x), r1=178(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 178
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
