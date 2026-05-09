; DESCRIPTION: Places a red line segment connecting (250, 159) to (87, 112).
; PLAN: r0=250(x1), r1=159(y1), r2=87(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 159
LDI r2, 87
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
