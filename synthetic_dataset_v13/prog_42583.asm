; DESCRIPTION: Places a black circle of radius 58 at center (278, 144).
; PLAN: r0=278(x), r1=144(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 144
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
