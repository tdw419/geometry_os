; DESCRIPTION: Places a magenta circle of radius 55 at center (188, 99).
; PLAN: r0=188(x), r1=99(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 99
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
