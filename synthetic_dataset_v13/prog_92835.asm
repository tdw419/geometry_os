; DESCRIPTION: Draws a blue circle centered at (377, 177) with radius 54.
; PLAN: r0=377(x), r1=177(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 177
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
