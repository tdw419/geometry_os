; DESCRIPTION: Places a black circle of radius 29 at center (253, 216).
; PLAN: r0=253(x), r1=216(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 216
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
