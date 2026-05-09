; DESCRIPTION: Places a magenta circle of radius 33 at center (240, 123).
; PLAN: r0=240(x), r1=123(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 123
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
