; DESCRIPTION: Composite: Renders a cyan disk with center (313, 109) and radius 74 then Sets a single orange pixel at (432, 158).
; PLAN: r0=313(x), r1=109(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=158(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 109
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 158
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
