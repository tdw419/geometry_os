; DESCRIPTION: Composite: Renders a black disk with center (86, 54) and radius 24 then Places a yellow dot at position (22, 254).
; PLAN: r0=86(x), r1=54(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=254(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 54
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 254
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
