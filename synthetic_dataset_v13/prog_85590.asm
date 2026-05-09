; DESCRIPTION: Places a magenta circle of radius 75 at center (311, 81).
; PLAN: r0=311(x), r1=81(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 81
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
