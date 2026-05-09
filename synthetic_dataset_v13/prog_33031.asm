; DESCRIPTION: Composite: Renders a red disk with center (50, 90) and radius 13 then Sets a single red pixel at (229, 181).
; PLAN: r0=50(x), r1=90(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=181(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 50
LDI r1, 90
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 181
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
