; DESCRIPTION: Places a red line segment connecting (56, 253) to (47, 84).
; PLAN: r0=56(x1), r1=253(y1), r2=47(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 253
LDI r2, 47
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
