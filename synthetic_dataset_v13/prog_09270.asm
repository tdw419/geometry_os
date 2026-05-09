; DESCRIPTION: Places a yellow circle of radius 18 at center (438, 179).
; PLAN: r0=438(x), r1=179(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 179
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
