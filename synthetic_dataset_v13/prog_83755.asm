; DESCRIPTION: Places a magenta circle of radius 10 at center (466, 81).
; PLAN: r0=466(x), r1=81(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 81
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
