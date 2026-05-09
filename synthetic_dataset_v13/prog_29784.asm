; DESCRIPTION: Places a black circle of radius 21 at center (101, 188).
; PLAN: r0=101(x), r1=188(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 188
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
