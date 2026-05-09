; DESCRIPTION: Places a red line segment connecting (483, 161) to (132, 106).
; PLAN: r0=483(x1), r1=161(y1), r2=132(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 161
LDI r2, 132
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
