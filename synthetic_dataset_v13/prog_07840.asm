; DESCRIPTION: Places a black circle of radius 56 at center (159, 169).
; PLAN: r0=159(x), r1=169(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 169
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
