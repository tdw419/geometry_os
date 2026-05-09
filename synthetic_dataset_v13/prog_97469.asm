; DESCRIPTION: Composite: Sets a single red pixel at (359, 194) then Renders a black disk with center (406, 31) and radius 12.
; PLAN: r0=359(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=31(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 406
LDI r6, 31
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
