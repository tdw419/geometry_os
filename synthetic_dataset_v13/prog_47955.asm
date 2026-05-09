; DESCRIPTION: Composite: Places a yellow dot at position (246, 41) then Renders a orange disk with center (325, 215) and radius 40.
; PLAN: r0=246(x), r1=41(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=215(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 246
LDI r1, 41
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 325
LDI r6, 215
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
