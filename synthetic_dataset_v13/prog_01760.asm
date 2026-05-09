; DESCRIPTION: Places a blue circle of radius 62 at center (328, 124).
; PLAN: r0=328(x), r1=124(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 124
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
