; DESCRIPTION: Places a black circle of radius 52 at center (270, 194).
; PLAN: r0=270(x), r1=194(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 194
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
