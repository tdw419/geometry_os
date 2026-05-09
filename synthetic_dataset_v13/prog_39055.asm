; DESCRIPTION: Renders a red disk with center (496, 44) and radius 13.
; PLAN: r0=496(x), r1=44(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 496
LDI r1, 44
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
