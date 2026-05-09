; DESCRIPTION: Composite: Sets a single orange pixel at (89, 205) then Renders a cyan line between points (179, 124) and (467, 110).
; PLAN: r0=89(x), r1=205(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=179(x1), r6=124(y1), r7=467(x2), r8=110(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 205
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 179
LDI r6, 124
LDI r7, 467
LDI r8, 110
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
