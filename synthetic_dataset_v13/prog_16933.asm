; DESCRIPTION: Places a blue circle of radius 48 at center (104, 198).
; PLAN: r0=104(x), r1=198(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 198
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
