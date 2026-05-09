; DESCRIPTION: Draws a magenta circle centered at (59, 208) with radius 41.
; PLAN: r0=59(x), r1=208(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 208
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
