; DESCRIPTION: Places a magenta circle of radius 76 at center (389, 87).
; PLAN: r0=389(x), r1=87(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 87
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
