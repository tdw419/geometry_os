; DESCRIPTION: Places a black circle of radius 49 at center (375, 126).
; PLAN: r0=375(x), r1=126(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 126
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
