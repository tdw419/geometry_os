; DESCRIPTION: Draws a magenta circle centered at (116, 189) with radius 46.
; PLAN: r0=116(x), r1=189(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 189
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
