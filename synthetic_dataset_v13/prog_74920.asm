; DESCRIPTION: Places a magenta circle of radius 35 at center (35, 69).
; PLAN: r0=35(x), r1=69(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 69
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
