; DESCRIPTION: Places a red line segment connecting (493, 212) to (185, 70).
; PLAN: r0=493(x1), r1=212(y1), r2=185(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 212
LDI r2, 185
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
