; DESCRIPTION: Places a yellow circle of radius 21 at center (231, 81).
; PLAN: r0=231(x), r1=81(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 81
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
