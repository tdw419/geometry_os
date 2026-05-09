; DESCRIPTION: Places a black circle of radius 63 at center (98, 108).
; PLAN: r0=98(x), r1=108(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 108
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
