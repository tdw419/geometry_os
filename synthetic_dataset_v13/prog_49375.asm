; DESCRIPTION: Places a red line segment connecting (252, 194) to (45, 88).
; PLAN: r0=252(x1), r1=194(y1), r2=45(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 194
LDI r2, 45
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
