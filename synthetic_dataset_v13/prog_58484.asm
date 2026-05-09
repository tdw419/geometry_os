; DESCRIPTION: Places a magenta circle of radius 22 at center (181, 80).
; PLAN: r0=181(x), r1=80(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 80
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
