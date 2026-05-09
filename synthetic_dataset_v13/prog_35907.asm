; DESCRIPTION: Composite: Sets a single orange pixel at (130, 156) then Renders a purple disk with center (308, 114) and radius 70.
; PLAN: r0=130(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=308(x), r6=114(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 130
LDI r1, 156
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 308
LDI r6, 114
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
