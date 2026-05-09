; DESCRIPTION: Draws a green circle centered at (362, 172) with radius 74.
; PLAN: r0=362(x), r1=172(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 172
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
