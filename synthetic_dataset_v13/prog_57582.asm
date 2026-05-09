; DESCRIPTION: Draws a magenta circle centered at (322, 176) with radius 41.
; PLAN: r0=322(x), r1=176(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 176
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
