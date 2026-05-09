; DESCRIPTION: Renders a orange line between points (91, 146) and (132, 54).
; PLAN: r0=91(x1), r1=146(y1), r2=132(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 146
LDI r2, 132
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
