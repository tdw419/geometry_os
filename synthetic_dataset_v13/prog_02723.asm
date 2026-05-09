; DESCRIPTION: Places a red line segment connecting (10, 185) to (150, 58).
; PLAN: r0=10(x1), r1=185(y1), r2=150(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 185
LDI r2, 150
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
