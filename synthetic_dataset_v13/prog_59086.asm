; DESCRIPTION: Composite: Renders a green line between points (186, 34) and (214, 241) then Sets a single red pixel at (140, 131).
; PLAN: r0=186(x1), r1=34(y1), r2=214(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=131(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 34
LDI r2, 214
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 131
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
