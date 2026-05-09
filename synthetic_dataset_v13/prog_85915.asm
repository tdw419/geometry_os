; DESCRIPTION: Renders a orange line between points (207, 133) and (7, 22).
; PLAN: r0=207(x1), r1=133(y1), r2=7(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 133
LDI r2, 7
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
