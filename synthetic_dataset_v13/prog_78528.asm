; DESCRIPTION: Composite: Renders a orange disk with center (306, 152) and radius 72 then Sets a single red pixel at (209, 101).
; PLAN: r0=306(x), r1=152(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=209(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 152
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 209
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
