; DESCRIPTION: Places a black circle of radius 19 at center (52, 195).
; PLAN: r0=52(x), r1=195(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 195
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
