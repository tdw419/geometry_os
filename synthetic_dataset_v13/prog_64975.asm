; DESCRIPTION: Places a yellow circle of radius 25 at center (354, 147).
; PLAN: r0=354(x), r1=147(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 147
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
