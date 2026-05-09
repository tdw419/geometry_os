; DESCRIPTION: Draws a magenta circle centered at (234, 215) with radius 31.
; PLAN: r0=234(x), r1=215(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 215
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
