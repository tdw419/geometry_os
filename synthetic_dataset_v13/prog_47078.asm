; DESCRIPTION: Places a black circle of radius 71 at center (203, 147).
; PLAN: r0=203(x), r1=147(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 147
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
