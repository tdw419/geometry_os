; DESCRIPTION: Places a green circle of radius 30 at center (170, 198).
; PLAN: r0=170(x), r1=198(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 198
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
