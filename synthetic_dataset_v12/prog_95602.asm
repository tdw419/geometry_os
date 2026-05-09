; DESCRIPTION: Places a magenta circle of radius 32 at center (345, 32).
; PLAN: r0=345(x), r1=32(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 32
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
