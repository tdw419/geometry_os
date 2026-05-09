; DESCRIPTION: Places a magenta circle of radius 74 at center (93, 122).
; PLAN: r0=93(x), r1=122(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 122
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
