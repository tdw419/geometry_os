; DESCRIPTION: Draws a magenta circle centered at (116, 172) with radius 71.
; PLAN: r0=116(x), r1=172(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 172
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
