; DESCRIPTION: Draws a black circle centered at (231, 212) with radius 37.
; PLAN: r0=231(x), r1=212(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 212
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
