; DESCRIPTION: Places a red line segment connecting (396, 57) to (162, 6).
; PLAN: r0=396(x1), r1=57(y1), r2=162(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 57
LDI r2, 162
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
