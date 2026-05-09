; DESCRIPTION: Draws a purple circle centered at (168, 60) with radius 47.
; PLAN: r0=168(x), r1=60(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 60
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
