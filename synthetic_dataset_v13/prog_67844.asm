; DESCRIPTION: Creates a yellow circular shape at (249, 147) with radius 18.
; PLAN: r0=249(x), r1=147(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 147
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
