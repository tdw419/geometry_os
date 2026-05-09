; DESCRIPTION: Places a green circle of radius 18 at center (97, 141).
; PLAN: r0=97(x), r1=141(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 141
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
