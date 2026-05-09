; DESCRIPTION: Places a red line segment connecting (156, 185) to (288, 15).
; PLAN: r0=156(x1), r1=185(y1), r2=288(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 185
LDI r2, 288
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
