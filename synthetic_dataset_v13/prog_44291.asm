; DESCRIPTION: Places a magenta circle of radius 63 at center (293, 122).
; PLAN: r0=293(x), r1=122(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 122
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
