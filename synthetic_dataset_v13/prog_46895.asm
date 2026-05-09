; DESCRIPTION: Renders a orange line between points (106, 118) and (235, 26).
; PLAN: r0=106(x1), r1=118(y1), r2=235(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 118
LDI r2, 235
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
