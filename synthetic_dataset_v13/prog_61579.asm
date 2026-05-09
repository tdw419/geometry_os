; DESCRIPTION: Composite: Places a red dot at position (406, 217) then Draws a orange line from (306, 243) to (40, 183).
; PLAN: r0=406(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=243(y1), r7=40(x2), r8=183(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 306
LDI r6, 243
LDI r7, 40
LDI r8, 183
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
