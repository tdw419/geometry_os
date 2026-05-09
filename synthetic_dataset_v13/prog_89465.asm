; DESCRIPTION: Composite: Draws a red line from (17, 118) to (48, 76) then Sets a single green pixel at (124, 234).
; PLAN: r0=17(x1), r1=118(y1), r2=48(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=234(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 17
LDI r1, 118
LDI r2, 48
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 234
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
