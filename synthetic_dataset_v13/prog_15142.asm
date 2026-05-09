; DESCRIPTION: Places a black circle of radius 33 at center (289, 125).
; PLAN: r0=289(x), r1=125(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 125
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
