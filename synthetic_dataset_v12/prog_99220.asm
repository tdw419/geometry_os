; DESCRIPTION: Composite: Renders a cyan line between points (364, 202) and (238, 109) then Sets a single orange pixel at (25, 49).
; PLAN: r0=364(x1), r1=202(y1), r2=238(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=49(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 202
LDI r2, 238
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 49
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
