; DESCRIPTION: Places a magenta circle of radius 47 at center (451, 100).
; PLAN: r0=451(x), r1=100(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 100
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
