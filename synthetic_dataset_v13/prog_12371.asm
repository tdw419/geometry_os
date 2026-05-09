; DESCRIPTION: Places a magenta circle of radius 32 at center (107, 196).
; PLAN: r0=107(x), r1=196(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 196
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
