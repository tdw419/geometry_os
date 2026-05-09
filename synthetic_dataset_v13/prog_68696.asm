; DESCRIPTION: Places a black circle of radius 40 at center (398, 130).
; PLAN: r0=398(x), r1=130(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 130
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
