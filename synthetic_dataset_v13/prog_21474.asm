; DESCRIPTION: Places a magenta circle of radius 78 at center (416, 106).
; PLAN: r0=416(x), r1=106(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 106
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
