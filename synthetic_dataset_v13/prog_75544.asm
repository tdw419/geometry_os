; DESCRIPTION: Places a red line segment connecting (115, 81) to (400, 234).
; PLAN: r0=115(x1), r1=81(y1), r2=400(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 81
LDI r2, 400
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
