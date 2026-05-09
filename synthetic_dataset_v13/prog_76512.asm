; DESCRIPTION: Places a yellow circle of radius 20 at center (85, 147).
; PLAN: r0=85(x), r1=147(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 147
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
