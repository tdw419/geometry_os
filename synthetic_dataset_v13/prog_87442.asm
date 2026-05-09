; DESCRIPTION: Draws a purple circle centered at (327, 142) with radius 54.
; PLAN: r0=327(x), r1=142(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 142
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
