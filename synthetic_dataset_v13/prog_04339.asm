; DESCRIPTION: Draws a magenta circle centered at (126, 198) with radius 51.
; PLAN: r0=126(x), r1=198(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 198
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
