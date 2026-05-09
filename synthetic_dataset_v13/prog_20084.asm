; DESCRIPTION: Draws a orange line from (179, 199) to (303, 167).
; PLAN: r0=179(x1), r1=199(y1), r2=303(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 199
LDI r2, 303
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
