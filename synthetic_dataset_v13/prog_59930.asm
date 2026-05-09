; DESCRIPTION: Composite: Renders a black disk with center (289, 67) and radius 55 then Places a orange dot at position (66, 136).
; PLAN: r0=289(x), r1=67(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=136(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 67
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 136
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
