; DESCRIPTION: Places a black circle of radius 12 at center (458, 189).
; PLAN: r0=458(x), r1=189(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 189
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
