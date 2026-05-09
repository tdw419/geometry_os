; DESCRIPTION: Composite: Sets a single orange pixel at (504, 186) then Draws a red line from (321, 184) to (149, 216).
; PLAN: r0=504(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=321(x1), r6=184(y1), r7=149(x2), r8=216(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 504
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 321
LDI r6, 184
LDI r7, 149
LDI r8, 216
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
