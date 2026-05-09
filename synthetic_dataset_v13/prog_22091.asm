; DESCRIPTION: Places a red line segment connecting (200, 142) to (149, 202).
; PLAN: r0=200(x1), r1=142(y1), r2=149(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 142
LDI r2, 149
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
