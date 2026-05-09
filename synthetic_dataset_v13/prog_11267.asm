; DESCRIPTION: Places a blue circle of radius 63 at center (253, 99).
; PLAN: r0=253(x), r1=99(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 99
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
