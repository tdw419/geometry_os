; DESCRIPTION: Places a black circle of radius 19 at center (203, 26).
; PLAN: r0=203(x), r1=26(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 26
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
