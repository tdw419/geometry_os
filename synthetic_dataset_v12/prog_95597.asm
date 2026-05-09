; DESCRIPTION: Places a black circle of radius 46 at center (411, 97).
; PLAN: r0=411(x), r1=97(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 97
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
