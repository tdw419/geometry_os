; DESCRIPTION: Places a black circle of radius 38 at center (55, 163).
; PLAN: r0=55(x), r1=163(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 163
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
