; DESCRIPTION: Places a magenta circle of radius 30 at center (432, 139).
; PLAN: r0=432(x), r1=139(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 139
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
