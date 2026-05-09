; DESCRIPTION: Composite: Renders a black disk with center (178, 86) and radius 68 then Places a yellow dot at position (63, 234).
; PLAN: r0=178(x), r1=86(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=234(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 86
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 234
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
