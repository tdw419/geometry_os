; DESCRIPTION: Places a black circle of radius 58 at center (203, 164).
; PLAN: r0=203(x), r1=164(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 164
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
