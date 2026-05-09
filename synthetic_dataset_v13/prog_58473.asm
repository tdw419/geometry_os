; DESCRIPTION: Composite: Places a white dot at position (503, 119) then Places a orange circle of radius 20 at center (391, 72).
; PLAN: r0=503(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=72(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 503
LDI r1, 119
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 72
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
