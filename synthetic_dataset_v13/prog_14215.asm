; DESCRIPTION: Places a magenta circle of radius 79 at center (185, 144).
; PLAN: r0=185(x), r1=144(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 144
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
