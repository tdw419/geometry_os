; DESCRIPTION: Places a magenta circle of radius 49 at center (190, 90).
; PLAN: r0=190(x), r1=90(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 90
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
