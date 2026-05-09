; DESCRIPTION: Places a black circle of radius 49 at center (259, 169).
; PLAN: r0=259(x), r1=169(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 169
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
