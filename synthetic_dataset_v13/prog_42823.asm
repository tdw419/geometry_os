; DESCRIPTION: Places a magenta circle of radius 58 at center (293, 63).
; PLAN: r0=293(x), r1=63(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 63
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
