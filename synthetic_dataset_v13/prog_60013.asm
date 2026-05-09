; DESCRIPTION: Places a blue circle of radius 17 at center (104, 205).
; PLAN: r0=104(x), r1=205(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 205
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
