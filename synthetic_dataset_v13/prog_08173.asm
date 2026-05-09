; DESCRIPTION: Places a black circle of radius 30 at center (79, 144).
; PLAN: r0=79(x), r1=144(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 144
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
