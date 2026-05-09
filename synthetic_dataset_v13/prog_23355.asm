; DESCRIPTION: Draws a purple circle centered at (124, 168) with radius 78.
; PLAN: r0=124(x), r1=168(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 168
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
