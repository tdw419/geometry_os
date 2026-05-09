; DESCRIPTION: Places a magenta circle of radius 79 at center (88, 123).
; PLAN: r0=88(x), r1=123(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 123
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
