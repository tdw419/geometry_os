; DESCRIPTION: Composite: Renders a red line between points (106, 213) and (17, 66) then Sets a single yellow pixel at (403, 212).
; PLAN: r0=106(x1), r1=213(y1), r2=17(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=212(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 213
LDI r2, 17
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 212
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
