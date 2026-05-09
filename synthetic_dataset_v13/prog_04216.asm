; DESCRIPTION: Places a red line segment connecting (468, 135) to (448, 56).
; PLAN: r0=468(x1), r1=135(y1), r2=448(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 135
LDI r2, 448
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
