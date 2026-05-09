; DESCRIPTION: Draws a magenta circle centered at (488, 155) with radius 11.
; PLAN: r0=488(x), r1=155(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 488
LDI r1, 155
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
