; DESCRIPTION: Draws a magenta circle centered at (138, 143) with radius 76.
; PLAN: r0=138(x), r1=143(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 143
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
