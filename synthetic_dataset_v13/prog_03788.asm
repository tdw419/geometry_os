; DESCRIPTION: Places a black circle of radius 25 at center (203, 54).
; PLAN: r0=203(x), r1=54(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 54
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
