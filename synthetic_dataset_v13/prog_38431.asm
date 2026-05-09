; DESCRIPTION: Renders a red disk with center (147, 104) and radius 22.
; PLAN: r0=147(x), r1=104(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 104
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
