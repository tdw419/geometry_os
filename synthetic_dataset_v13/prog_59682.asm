; DESCRIPTION: Draws a orange line from (177, 118) to (262, 130).
; PLAN: r0=177(x1), r1=118(y1), r2=262(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 118
LDI r2, 262
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
