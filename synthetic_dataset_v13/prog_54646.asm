; DESCRIPTION: Places a green circle of radius 63 at center (318, 67).
; PLAN: r0=318(x), r1=67(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 67
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
