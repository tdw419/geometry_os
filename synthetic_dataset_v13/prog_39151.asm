; DESCRIPTION: Draws a purple circle centered at (191, 59) with radius 53.
; PLAN: r0=191(x), r1=59(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 59
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
