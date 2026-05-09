; DESCRIPTION: Composite: Places a yellow dot at position (328, 11) then Renders a orange disk with center (318, 147) and radius 80.
; PLAN: r0=328(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=147(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 318
LDI r6, 147
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
