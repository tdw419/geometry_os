; DESCRIPTION: Composite: Renders a yellow disk with center (263, 78) and radius 35 then Places a green dot at position (41, 35).
; PLAN: r0=263(x), r1=78(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=35(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 78
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 35
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
