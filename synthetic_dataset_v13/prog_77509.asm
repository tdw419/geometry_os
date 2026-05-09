; DESCRIPTION: Places a magenta circle of radius 68 at center (138, 80).
; PLAN: r0=138(x), r1=80(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 80
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
