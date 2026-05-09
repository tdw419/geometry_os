; DESCRIPTION: Places a black circle of radius 58 at center (254, 98).
; PLAN: r0=254(x), r1=98(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 98
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
