; DESCRIPTION: Places a black circle of radius 24 at center (290, 199).
; PLAN: r0=290(x), r1=199(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 199
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
