; DESCRIPTION: Places a black circle of radius 80 at center (231, 99).
; PLAN: r0=231(x), r1=99(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 99
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
