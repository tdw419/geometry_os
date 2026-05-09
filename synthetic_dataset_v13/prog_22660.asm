; DESCRIPTION: Places a magenta circle of radius 11 at center (490, 161).
; PLAN: r0=490(x), r1=161(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 490
LDI r1, 161
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
