; DESCRIPTION: Composite: Renders a red line between points (494, 197) and (353, 101) then Sets a single orange pixel at (95, 226).
; PLAN: r0=494(x1), r1=197(y1), r2=353(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=226(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 494
LDI r1, 197
LDI r2, 353
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 226
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
