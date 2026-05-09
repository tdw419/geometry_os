; DESCRIPTION: Composite: Sets a single orange pixel at (378, 229) then Places a cyan line segment connecting (466, 14) to (279, 14).
; PLAN: r0=378(x), r1=229(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=466(x1), r6=14(y1), r7=279(x2), r8=14(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 229
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 466
LDI r6, 14
LDI r7, 279
LDI r8, 14
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
