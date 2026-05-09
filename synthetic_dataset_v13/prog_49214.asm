; DESCRIPTION: Places a red line segment connecting (50, 169) to (483, 127).
; PLAN: r0=50(x1), r1=169(y1), r2=483(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 169
LDI r2, 483
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
