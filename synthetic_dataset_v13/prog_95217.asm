; DESCRIPTION: Renders a orange line between points (393, 185) and (91, 23).
; PLAN: r0=393(x1), r1=185(y1), r2=91(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 185
LDI r2, 91
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
