; DESCRIPTION: Composite: Places a black circle of radius 65 at center (118, 157) then Sets a single orange pixel at (166, 157).
; PLAN: r0=118(x), r1=157(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=157(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 157
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 157
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
