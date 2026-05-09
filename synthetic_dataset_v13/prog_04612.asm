; DESCRIPTION: Places a black circle of radius 37 at center (453, 56).
; PLAN: r0=453(x), r1=56(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 56
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
