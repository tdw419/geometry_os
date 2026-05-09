; DESCRIPTION: Draws a magenta circle centered at (230, 138) with radius 71.
; PLAN: r0=230(x), r1=138(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 138
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
