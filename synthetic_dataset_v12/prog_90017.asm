; DESCRIPTION: Composite: Creates a orange circular shape at (368, 155) with radius 70 then Places a orange dot at position (1, 245).
; PLAN: r0=368(x), r1=155(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x), r6=245(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 155
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 245
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
