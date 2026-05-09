; DESCRIPTION: Places a magenta circle of radius 28 at center (64, 81).
; PLAN: r0=64(x), r1=81(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 81
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
