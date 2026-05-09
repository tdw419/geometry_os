; DESCRIPTION: Places a yellow circle of radius 47 at center (147, 199).
; PLAN: r0=147(x), r1=199(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 199
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
