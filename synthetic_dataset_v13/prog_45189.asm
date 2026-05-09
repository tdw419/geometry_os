; DESCRIPTION: Composite: Renders a yellow line between points (471, 47) and (296, 55) then Sets a single black pixel at (60, 97).
; PLAN: r0=471(x1), r1=47(y1), r2=296(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=97(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 471
LDI r1, 47
LDI r2, 296
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 97
LDI r7, 0x000000
PSET r5, r6, r7
HALT
