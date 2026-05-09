; DESCRIPTION: Draws a magenta circle centered at (407, 27) with radius 25.
; PLAN: r0=407(x), r1=27(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 27
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
