; DESCRIPTION: Places a red line segment connecting (208, 14) to (451, 43).
; PLAN: r0=208(x1), r1=14(y1), r2=451(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 14
LDI r2, 451
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
