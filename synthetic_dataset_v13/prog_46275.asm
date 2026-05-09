; DESCRIPTION: Composite: Renders a orange disk with center (172, 48) and radius 19 then Places a yellow dot at position (270, 41).
; PLAN: r0=172(x), r1=48(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=41(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 48
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 41
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
