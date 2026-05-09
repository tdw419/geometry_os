; DESCRIPTION: Places a red line segment connecting (234, 121) to (158, 87).
; PLAN: r0=234(x1), r1=121(y1), r2=158(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 121
LDI r2, 158
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
