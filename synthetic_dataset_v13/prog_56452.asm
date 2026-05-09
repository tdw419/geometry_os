; DESCRIPTION: Places a magenta circle of radius 61 at center (119, 96).
; PLAN: r0=119(x), r1=96(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 96
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
