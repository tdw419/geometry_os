; DESCRIPTION: Places a magenta circle of radius 68 at center (359, 114).
; PLAN: r0=359(x), r1=114(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 114
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
