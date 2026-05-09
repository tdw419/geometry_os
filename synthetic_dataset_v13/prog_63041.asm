; DESCRIPTION: Draws a magenta circle centered at (234, 128) with radius 77.
; PLAN: r0=234(x), r1=128(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 128
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
