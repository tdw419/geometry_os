; DESCRIPTION: Composite: Renders a black disk with center (105, 137) and radius 21 then Places a orange dot at position (195, 193).
; PLAN: r0=105(x), r1=137(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=193(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 137
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 193
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
