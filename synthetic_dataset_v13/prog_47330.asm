; DESCRIPTION: Places a magenta circle of radius 22 at center (86, 64).
; PLAN: r0=86(x), r1=64(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 64
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
