; DESCRIPTION: Composite: Renders a cyan disk with center (376, 85) and radius 75 then Sets a single red pixel at (227, 127).
; PLAN: r0=376(x), r1=85(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=127(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 85
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 127
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
