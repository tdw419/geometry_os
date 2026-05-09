; DESCRIPTION: Composite: Renders a red disk with center (178, 82) and radius 17 then Sets a single black pixel at (42, 40).
; PLAN: r0=178(x), r1=82(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=40(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 82
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 40
LDI r7, 0x000000
PSET r5, r6, r7
HALT
