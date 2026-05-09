; DESCRIPTION: Composite: Sets a single cyan pixel at (433, 23) then Renders a purple line between points (426, 89) and (141, 223).
; PLAN: r0=433(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=426(x1), r6=89(y1), r7=141(x2), r8=223(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 89
LDI r7, 141
LDI r8, 223
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
