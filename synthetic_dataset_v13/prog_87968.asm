; DESCRIPTION: Places a black circle of radius 13 at center (187, 148).
; PLAN: r0=187(x), r1=148(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 148
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
