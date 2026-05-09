; DESCRIPTION: Places a orange line segment connecting (177, 17) to (105, 112).
; PLAN: r0=177(x1), r1=17(y1), r2=105(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 17
LDI r2, 105
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
