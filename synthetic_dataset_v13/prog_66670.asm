; DESCRIPTION: Places a red line segment connecting (248, 133) to (396, 248).
; PLAN: r0=248(x1), r1=133(y1), r2=396(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 133
LDI r2, 396
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
