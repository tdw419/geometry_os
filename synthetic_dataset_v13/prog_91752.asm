; DESCRIPTION: Places a black circle of radius 71 at center (302, 104).
; PLAN: r0=302(x), r1=104(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 104
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
