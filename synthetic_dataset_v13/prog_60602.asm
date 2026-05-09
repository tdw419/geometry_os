; DESCRIPTION: Places a green circle of radius 58 at center (454, 136).
; PLAN: r0=454(x), r1=136(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 136
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
