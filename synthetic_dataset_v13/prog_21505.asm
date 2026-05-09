; DESCRIPTION: Composite: Sets a single red pixel at (275, 57) then Draws a green line from (16, 158) to (31, 18).
; PLAN: r0=275(x), r1=57(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=16(x1), r6=158(y1), r7=31(x2), r8=18(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 57
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 16
LDI r6, 158
LDI r7, 31
LDI r8, 18
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
