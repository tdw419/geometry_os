; DESCRIPTION: Places a blue circle of radius 37 at center (363, 203).
; PLAN: r0=363(x), r1=203(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 203
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
