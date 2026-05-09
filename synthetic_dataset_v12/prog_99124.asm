; DESCRIPTION: Places a magenta circle of radius 37 at center (190, 119).
; PLAN: r0=190(x), r1=119(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 119
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
