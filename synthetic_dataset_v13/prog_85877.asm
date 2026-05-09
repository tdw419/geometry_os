; DESCRIPTION: Composite: Draws a red line from (62, 71) to (197, 96) then Sets a single orange pixel at (300, 93).
; PLAN: r0=62(x1), r1=71(y1), r2=197(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=93(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 71
LDI r2, 197
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 93
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
