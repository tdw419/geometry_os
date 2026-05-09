; DESCRIPTION: Places a magenta circle of radius 19 at center (136, 55).
; PLAN: r0=136(x), r1=55(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 55
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
