; DESCRIPTION: Places a black circle of radius 55 at center (144, 144).
; PLAN: r0=144(x), r1=144(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 144
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
