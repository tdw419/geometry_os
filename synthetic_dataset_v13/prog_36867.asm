; DESCRIPTION: Composite: Sets a single black pixel at (102, 234) then Renders a cyan line between points (276, 143) and (106, 218).
; PLAN: r0=102(x), r1=234(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=276(x1), r6=143(y1), r7=106(x2), r8=218(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 234
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 276
LDI r6, 143
LDI r7, 106
LDI r8, 218
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
