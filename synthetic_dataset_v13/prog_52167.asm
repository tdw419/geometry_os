; DESCRIPTION: Creates a blue circular shape at (451, 206) with radius 19.
; PLAN: r0=451(x), r1=206(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 206
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
