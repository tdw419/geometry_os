; DESCRIPTION: Composite: Renders a blue line between points (77, 221) and (451, 226) then Sets a single yellow pixel at (423, 52).
; PLAN: r0=77(x1), r1=221(y1), r2=451(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=52(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 221
LDI r2, 451
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 52
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
