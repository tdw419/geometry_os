; DESCRIPTION: Draws a purple circle centered at (86, 116) with radius 59.
; PLAN: r0=86(x), r1=116(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 116
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
