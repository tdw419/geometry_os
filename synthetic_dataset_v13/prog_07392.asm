; DESCRIPTION: Draws a magenta circle centered at (467, 235) with radius 17.
; PLAN: r0=467(x), r1=235(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 235
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
