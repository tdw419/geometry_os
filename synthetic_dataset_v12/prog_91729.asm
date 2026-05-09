; DESCRIPTION: Places a red line segment connecting (193, 145) to (317, 203).
; PLAN: r0=193(x1), r1=145(y1), r2=317(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 145
LDI r2, 317
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
