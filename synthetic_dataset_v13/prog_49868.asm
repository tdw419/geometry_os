; DESCRIPTION: Composite: Sets a single orange pixel at (157, 208) then Renders a white disk with center (107, 167) and radius 59.
; PLAN: r0=157(x), r1=208(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=167(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 157
LDI r1, 208
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 107
LDI r6, 167
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
