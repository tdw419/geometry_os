; DESCRIPTION: Places a black circle of radius 76 at center (289, 173).
; PLAN: r0=289(x), r1=173(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 173
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
