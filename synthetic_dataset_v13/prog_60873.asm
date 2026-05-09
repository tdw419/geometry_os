; DESCRIPTION: Places a orange line segment connecting (187, 106) to (112, 51).
; PLAN: r0=187(x1), r1=106(y1), r2=112(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 106
LDI r2, 112
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
