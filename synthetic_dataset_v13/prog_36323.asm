; DESCRIPTION: Places a black circle of radius 24 at center (389, 187).
; PLAN: r0=389(x), r1=187(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 187
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
