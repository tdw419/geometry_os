; DESCRIPTION: Places a magenta circle of radius 20 at center (194, 84).
; PLAN: r0=194(x), r1=84(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 84
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
