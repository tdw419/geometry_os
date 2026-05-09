; DESCRIPTION: Places a red line segment connecting (99, 116) to (208, 179).
; PLAN: r0=99(x1), r1=116(y1), r2=208(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 116
LDI r2, 208
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
