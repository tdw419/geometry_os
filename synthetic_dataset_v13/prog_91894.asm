; DESCRIPTION: Composite: Places a orange dot at position (426, 94) then Renders a purple line between points (37, 61) and (484, 91).
; PLAN: r0=426(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=37(x1), r6=61(y1), r7=484(x2), r8=91(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 94
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 37
LDI r6, 61
LDI r7, 484
LDI r8, 91
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
