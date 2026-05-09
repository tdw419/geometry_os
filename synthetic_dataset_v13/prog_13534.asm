; DESCRIPTION: Renders a orange line between points (91, 106) and (3, 207).
; PLAN: r0=91(x1), r1=106(y1), r2=3(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 106
LDI r2, 3
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
