; DESCRIPTION: Places a red line segment connecting (208, 106) to (133, 83).
; PLAN: r0=208(x1), r1=106(y1), r2=133(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 106
LDI r2, 133
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
