; DESCRIPTION: Composite: Places a orange dot at position (51, 212) then Draws a orange line from (96, 81) to (65, 85).
; PLAN: r0=51(x), r1=212(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=81(y1), r7=65(x2), r8=85(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 212
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 96
LDI r6, 81
LDI r7, 65
LDI r8, 85
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
