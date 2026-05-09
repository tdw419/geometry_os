; DESCRIPTION: Places a magenta circle of radius 15 at center (98, 115).
; PLAN: r0=98(x), r1=115(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 115
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
