; DESCRIPTION: Composite: Sets a single green pixel at (272, 107) then Renders a orange disk with center (73, 194) and radius 38.
; PLAN: r0=272(x), r1=107(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=194(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 107
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 73
LDI r6, 194
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
