; DESCRIPTION: Composite: Renders a orange line between points (314, 34) and (20, 202) then Places a red dot at position (51, 185).
; PLAN: r0=314(x1), r1=34(y1), r2=20(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=185(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 34
LDI r2, 20
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 185
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
