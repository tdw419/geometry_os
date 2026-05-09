; DESCRIPTION: Places a magenta circle of radius 58 at center (77, 88).
; PLAN: r0=77(x), r1=88(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 88
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
