; DESCRIPTION: Draws a purple circle centered at (403, 184) with radius 67.
; PLAN: r0=403(x), r1=184(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 184
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
