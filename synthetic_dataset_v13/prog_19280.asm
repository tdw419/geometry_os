; DESCRIPTION: Draws a blue circle centered at (362, 203) with radius 53.
; PLAN: r0=362(x), r1=203(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 203
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
