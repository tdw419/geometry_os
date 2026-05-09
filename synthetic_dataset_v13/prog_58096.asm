; DESCRIPTION: Composite: Sets a single cyan pixel at (0, 167) then Places a orange circle of radius 62 at center (241, 71).
; PLAN: r0=0(x), r1=167(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=71(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 0
LDI r1, 167
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 71
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
