; DESCRIPTION: Composite: Sets a single cyan pixel at (158, 124) then Renders a green line between points (17, 155) and (146, 181).
; PLAN: r0=158(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=17(x1), r6=155(y1), r7=146(x2), r8=181(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 155
LDI r7, 146
LDI r8, 181
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
