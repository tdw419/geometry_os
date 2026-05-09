; DESCRIPTION: Places a magenta circle of radius 17 at center (200, 212).
; PLAN: r0=200(x), r1=212(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 212
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
