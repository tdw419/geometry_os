; DESCRIPTION: Composite: Renders a orange disk with center (320, 213) and radius 41 then Places a orange dot at position (185, 47).
; PLAN: r0=320(x), r1=213(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=47(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 213
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 47
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
