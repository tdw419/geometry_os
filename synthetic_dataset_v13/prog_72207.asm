; DESCRIPTION: Places a magenta circle of radius 29 at center (477, 179).
; PLAN: r0=477(x), r1=179(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 179
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
