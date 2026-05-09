; DESCRIPTION: Places a black circle of radius 27 at center (337, 147).
; PLAN: r0=337(x), r1=147(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 147
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
