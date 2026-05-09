; DESCRIPTION: Places a black circle of radius 66 at center (182, 184).
; PLAN: r0=182(x), r1=184(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 184
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
