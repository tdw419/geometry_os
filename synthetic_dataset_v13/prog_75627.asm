; DESCRIPTION: Places a black circle of radius 12 at center (229, 108).
; PLAN: r0=229(x), r1=108(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 108
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
