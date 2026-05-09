; DESCRIPTION: Places a black circle of radius 64 at center (272, 148).
; PLAN: r0=272(x), r1=148(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 148
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
