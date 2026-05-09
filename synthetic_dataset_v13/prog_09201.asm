; DESCRIPTION: Places a magenta circle of radius 79 at center (359, 79).
; PLAN: r0=359(x), r1=79(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 79
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
