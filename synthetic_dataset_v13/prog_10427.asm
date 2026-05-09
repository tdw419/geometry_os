; DESCRIPTION: Places a magenta circle of radius 65 at center (286, 145).
; PLAN: r0=286(x), r1=145(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 145
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
