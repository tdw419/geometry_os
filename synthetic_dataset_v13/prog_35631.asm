; DESCRIPTION: Places a red line segment connecting (262, 170) to (492, 87).
; PLAN: r0=262(x1), r1=170(y1), r2=492(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 170
LDI r2, 492
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
