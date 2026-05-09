; DESCRIPTION: Composite: Draws a red line from (389, 251) to (193, 216) then Draws a orange rectangle at (340, 177) with width 106 and height 27.
; PLAN: r0=389(x1), r1=251(y1), r2=193(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=177(y), r7=106(width), r8=27(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 251
LDI r2, 193
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 177
LDI r7, 106
LDI r8, 27
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
