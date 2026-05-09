; DESCRIPTION: Places a red line segment connecting (151, 56) to (7, 163).
; PLAN: r0=151(x1), r1=56(y1), r2=7(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 56
LDI r2, 7
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
