; DESCRIPTION: Places a red line segment connecting (311, 71) to (438, 37).
; PLAN: r0=311(x1), r1=71(y1), r2=438(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 71
LDI r2, 438
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
