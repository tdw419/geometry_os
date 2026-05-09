; DESCRIPTION: Places a red line segment connecting (120, 123) to (337, 6).
; PLAN: r0=120(x1), r1=123(y1), r2=337(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 123
LDI r2, 337
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
