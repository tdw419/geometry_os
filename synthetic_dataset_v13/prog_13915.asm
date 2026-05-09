; DESCRIPTION: Places a magenta circle of radius 68 at center (153, 106).
; PLAN: r0=153(x), r1=106(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 106
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
