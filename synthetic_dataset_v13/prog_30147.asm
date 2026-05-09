; DESCRIPTION: Composite: Places a orange dot at position (299, 48) then Places a orange circle of radius 65 at center (188, 179).
; PLAN: r0=299(x), r1=48(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=179(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 299
LDI r1, 48
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 188
LDI r6, 179
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
