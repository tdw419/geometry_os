; DESCRIPTION: Renders a orange line between points (489, 91) and (475, 177).
; PLAN: r0=489(x1), r1=91(y1), r2=475(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 91
LDI r2, 475
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
