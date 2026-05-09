; DESCRIPTION: Places a red line segment connecting (283, 1) to (62, 163).
; PLAN: r0=283(x1), r1=1(y1), r2=62(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 1
LDI r2, 62
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
