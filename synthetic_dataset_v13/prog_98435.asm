; DESCRIPTION: Places a red line segment connecting (7, 231) to (145, 35).
; PLAN: r0=7(x1), r1=231(y1), r2=145(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 231
LDI r2, 145
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
