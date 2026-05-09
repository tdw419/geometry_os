; DESCRIPTION: Creates a blue circular shape at (206, 192) with radius 63.
; PLAN: r0=206(x), r1=192(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 192
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
