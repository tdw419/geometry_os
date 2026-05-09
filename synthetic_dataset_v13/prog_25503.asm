; DESCRIPTION: Composite: Sets a single orange pixel at (445, 62) then Renders a green disk with center (229, 139) and radius 41.
; PLAN: r0=445(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=229(x), r6=139(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 229
LDI r6, 139
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
