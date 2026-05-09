; DESCRIPTION: Places a magenta circle of radius 80 at center (426, 119).
; PLAN: r0=426(x), r1=119(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 119
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
