; DESCRIPTION: Composite: Renders a orange disk with center (75, 67) and radius 33 then Sets a single black pixel at (27, 182).
; PLAN: r0=75(x), r1=67(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=182(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 67
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 182
LDI r7, 0x000000
PSET r5, r6, r7
HALT
