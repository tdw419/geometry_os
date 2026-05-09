; DESCRIPTION: Places a magenta circle of radius 72 at center (132, 79).
; PLAN: r0=132(x), r1=79(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 79
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
