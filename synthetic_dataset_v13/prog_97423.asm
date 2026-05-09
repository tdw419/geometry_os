; DESCRIPTION: Places a magenta circle of radius 18 at center (396, 200).
; PLAN: r0=396(x), r1=200(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 200
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
