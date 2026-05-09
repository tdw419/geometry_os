; DESCRIPTION: Places a red line segment connecting (37, 3) to (26, 214).
; PLAN: r0=37(x1), r1=3(y1), r2=26(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 3
LDI r2, 26
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
