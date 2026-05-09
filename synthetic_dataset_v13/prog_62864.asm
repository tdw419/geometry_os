; DESCRIPTION: Composite: Renders a red line between points (322, 34) and (174, 26) then Sets a single purple pixel at (65, 13).
; PLAN: r0=322(x1), r1=34(y1), r2=174(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=13(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 34
LDI r2, 174
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 13
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
