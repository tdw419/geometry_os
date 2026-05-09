; DESCRIPTION: Composite: Sets a single purple pixel at (396, 198) then Renders a yellow line between points (251, 213) and (172, 163).
; PLAN: r0=396(x), r1=198(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=251(x1), r6=213(y1), r7=172(x2), r8=163(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 198
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 213
LDI r7, 172
LDI r8, 163
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
