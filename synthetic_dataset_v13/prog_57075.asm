; DESCRIPTION: Places a magenta circle of radius 13 at center (388, 23).
; PLAN: r0=388(x), r1=23(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 23
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
