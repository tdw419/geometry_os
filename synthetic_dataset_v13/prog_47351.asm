; DESCRIPTION: Places a green circle of radius 40 at center (461, 137).
; PLAN: r0=461(x), r1=137(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 137
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
