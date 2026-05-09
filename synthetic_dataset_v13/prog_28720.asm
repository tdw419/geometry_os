; DESCRIPTION: Places a red line segment connecting (133, 8) to (66, 66).
; PLAN: r0=133(x1), r1=8(y1), r2=66(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 8
LDI r2, 66
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
