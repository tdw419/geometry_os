; DESCRIPTION: Places a red line segment connecting (118, 191) to (205, 150).
; PLAN: r0=118(x1), r1=191(y1), r2=205(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 191
LDI r2, 205
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
