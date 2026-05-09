; DESCRIPTION: Places a red line segment connecting (13, 50) to (80, 4).
; PLAN: r0=13(x1), r1=50(y1), r2=80(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 50
LDI r2, 80
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
