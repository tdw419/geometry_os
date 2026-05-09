; DESCRIPTION: Places a red line segment connecting (451, 14) to (220, 247).
; PLAN: r0=451(x1), r1=14(y1), r2=220(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 14
LDI r2, 220
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
