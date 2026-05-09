; DESCRIPTION: Places a red line segment connecting (444, 72) to (493, 75).
; PLAN: r0=444(x1), r1=72(y1), r2=493(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 72
LDI r2, 493
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
