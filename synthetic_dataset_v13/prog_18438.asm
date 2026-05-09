; DESCRIPTION: Places a red circle of radius 37 at center (147, 45).
; PLAN: r0=147(x), r1=45(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 45
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
