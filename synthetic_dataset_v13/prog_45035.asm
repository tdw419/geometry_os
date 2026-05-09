; DESCRIPTION: Places a red line segment connecting (143, 205) to (489, 158).
; PLAN: r0=143(x1), r1=205(y1), r2=489(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 205
LDI r2, 489
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
