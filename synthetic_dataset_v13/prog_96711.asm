; DESCRIPTION: Places a red line segment connecting (450, 1) to (181, 119).
; PLAN: r0=450(x1), r1=1(y1), r2=181(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 1
LDI r2, 181
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
