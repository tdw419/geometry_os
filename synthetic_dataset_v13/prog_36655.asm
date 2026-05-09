; DESCRIPTION: Composite: Sets a single red pixel at (251, 2) then Draws a cyan line from (193, 185) to (254, 38).
; PLAN: r0=251(x), r1=2(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=193(x1), r6=185(y1), r7=254(x2), r8=38(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 2
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 193
LDI r6, 185
LDI r7, 254
LDI r8, 38
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
