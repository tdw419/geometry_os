; DESCRIPTION: Places a magenta circle of radius 12 at center (134, 72).
; PLAN: r0=134(x), r1=72(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 72
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
