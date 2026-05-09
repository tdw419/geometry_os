; DESCRIPTION: Places a black circle of radius 50 at center (166, 110).
; PLAN: r0=166(x), r1=110(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 110
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
