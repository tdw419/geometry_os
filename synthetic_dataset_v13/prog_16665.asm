; DESCRIPTION: Composite: Places a orange dot at position (478, 89) then Places a green circle of radius 38 at center (268, 180).
; PLAN: r0=478(x), r1=89(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=180(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 478
LDI r1, 89
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 268
LDI r6, 180
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
