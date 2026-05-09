; DESCRIPTION: Renders a orange line between points (276, 169) and (152, 217).
; PLAN: r0=276(x1), r1=169(y1), r2=152(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 169
LDI r2, 152
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
