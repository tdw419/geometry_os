; DESCRIPTION: Places a magenta circle of radius 64 at center (430, 129).
; PLAN: r0=430(x), r1=129(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 129
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
