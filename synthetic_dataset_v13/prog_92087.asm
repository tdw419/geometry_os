; DESCRIPTION: Places a blue circle of radius 16 at center (89, 198).
; PLAN: r0=89(x), r1=198(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 198
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
