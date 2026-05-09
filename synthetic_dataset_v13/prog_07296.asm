; DESCRIPTION: Draws a orange line from (303, 106) to (407, 141).
; PLAN: r0=303(x1), r1=106(y1), r2=407(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 106
LDI r2, 407
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
