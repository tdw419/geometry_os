; DESCRIPTION: Places a magenta circle of radius 74 at center (422, 87).
; PLAN: r0=422(x), r1=87(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 87
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
