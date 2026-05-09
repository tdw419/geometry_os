; DESCRIPTION: Draws a purple circle centered at (403, 175) with radius 72.
; PLAN: r0=403(x), r1=175(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 175
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
