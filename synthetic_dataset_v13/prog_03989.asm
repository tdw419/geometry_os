; DESCRIPTION: Places a black circle of radius 10 at center (148, 91).
; PLAN: r0=148(x), r1=91(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 91
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
