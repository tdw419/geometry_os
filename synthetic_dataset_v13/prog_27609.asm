; DESCRIPTION: Places a magenta circle of radius 44 at center (360, 123).
; PLAN: r0=360(x), r1=123(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 123
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
