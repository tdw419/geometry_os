; DESCRIPTION: Composite: Renders a red disk with center (47, 229) and radius 23 then Places a orange dot at position (166, 17).
; PLAN: r0=47(x), r1=229(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=17(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 229
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 17
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
