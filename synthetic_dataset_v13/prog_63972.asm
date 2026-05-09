; DESCRIPTION: Places a magenta circle of radius 39 at center (452, 87).
; PLAN: r0=452(x), r1=87(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 87
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
