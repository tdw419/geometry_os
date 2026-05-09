; DESCRIPTION: Composite: Renders a black line between points (187, 190) and (171, 76) then Sets a single red pixel at (439, 198).
; PLAN: r0=187(x1), r1=190(y1), r2=171(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=198(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 190
LDI r2, 171
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 198
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
