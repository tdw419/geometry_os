; DESCRIPTION: Composite: Sets a single green pixel at (202, 246) then Places a orange circle of radius 79 at center (122, 112).
; PLAN: r0=202(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=112(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 202
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 122
LDI r6, 112
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
