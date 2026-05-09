; DESCRIPTION: Places a red line segment connecting (12, 169) to (337, 134).
; PLAN: r0=12(x1), r1=169(y1), r2=337(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 169
LDI r2, 337
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
