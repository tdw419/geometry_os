; DESCRIPTION: Composite: Renders a orange disk with center (414, 113) and radius 62 then Places a green dot at position (147, 223).
; PLAN: r0=414(x), r1=113(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=223(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 113
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 223
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
