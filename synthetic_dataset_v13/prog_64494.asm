; DESCRIPTION: Composite: Sets a single orange pixel at (244, 252) then Draws a red line from (230, 223) to (424, 63).
; PLAN: r0=244(x), r1=252(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=223(y1), r7=424(x2), r8=63(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 252
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 230
LDI r6, 223
LDI r7, 424
LDI r8, 63
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
