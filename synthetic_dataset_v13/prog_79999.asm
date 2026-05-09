; DESCRIPTION: Composite: Places a purple dot at position (296, 156) then Renders a black disk with center (205, 105) and radius 24.
; PLAN: r0=296(x), r1=156(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=105(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 156
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 205
LDI r6, 105
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
