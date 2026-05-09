; DESCRIPTION: Places a red line segment connecting (69, 88) to (426, 201).
; PLAN: r0=69(x1), r1=88(y1), r2=426(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 88
LDI r2, 426
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
