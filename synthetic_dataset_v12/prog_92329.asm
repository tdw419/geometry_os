; DESCRIPTION: Places a black circle of radius 24 at center (356, 132).
; PLAN: r0=356(x), r1=132(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 132
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
