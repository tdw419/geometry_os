; DESCRIPTION: Places a magenta circle of radius 10 at center (30, 88).
; PLAN: r0=30(x), r1=88(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 88
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
