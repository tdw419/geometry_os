; DESCRIPTION: Composite: Renders a black disk with center (150, 189) and radius 12 then Places a green dot at position (56, 234).
; PLAN: r0=150(x), r1=189(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=234(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 189
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 234
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
