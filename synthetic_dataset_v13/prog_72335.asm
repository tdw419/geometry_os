; DESCRIPTION: Places a red line segment connecting (259, 186) to (212, 169).
; PLAN: r0=259(x1), r1=186(y1), r2=212(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 186
LDI r2, 212
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
