; DESCRIPTION: Places a black circle of radius 49 at center (245, 125).
; PLAN: r0=245(x), r1=125(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 125
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
