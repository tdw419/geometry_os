; DESCRIPTION: Places a magenta circle of radius 34 at center (107, 80).
; PLAN: r0=107(x), r1=80(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 80
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
