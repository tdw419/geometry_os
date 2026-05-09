; DESCRIPTION: Places a black circle of radius 25 at center (122, 107).
; PLAN: r0=122(x), r1=107(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 107
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
