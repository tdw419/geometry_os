; DESCRIPTION: Composite: Places a cyan dot at position (466, 49) then Renders a cyan line between points (451, 15) and (334, 112).
; PLAN: r0=466(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=451(x1), r6=15(y1), r7=334(x2), r8=112(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 451
LDI r6, 15
LDI r7, 334
LDI r8, 112
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
