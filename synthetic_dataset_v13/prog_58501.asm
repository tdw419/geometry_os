; DESCRIPTION: Places a black circle of radius 76 at center (305, 155).
; PLAN: r0=305(x), r1=155(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 155
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
