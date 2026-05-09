; DESCRIPTION: Places a magenta circle of radius 63 at center (250, 101).
; PLAN: r0=250(x), r1=101(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 101
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
