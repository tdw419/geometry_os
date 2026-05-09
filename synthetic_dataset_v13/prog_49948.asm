; DESCRIPTION: Places a magenta circle of radius 16 at center (31, 88).
; PLAN: r0=31(x), r1=88(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 88
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
