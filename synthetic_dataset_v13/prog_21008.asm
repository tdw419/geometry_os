; DESCRIPTION: Places a magenta circle of radius 11 at center (138, 235).
; PLAN: r0=138(x), r1=235(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 235
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
