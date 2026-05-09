; DESCRIPTION: Composite: Places a red dot at position (229, 25) then Draws a orange line from (150, 64) to (438, 72).
; PLAN: r0=229(x), r1=25(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=150(x1), r6=64(y1), r7=438(x2), r8=72(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 25
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 150
LDI r6, 64
LDI r7, 438
LDI r8, 72
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
