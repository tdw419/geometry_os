; DESCRIPTION: Places a red line segment connecting (203, 112) to (201, 184).
; PLAN: r0=203(x1), r1=112(y1), r2=201(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 112
LDI r2, 201
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
