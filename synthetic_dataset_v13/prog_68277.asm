; DESCRIPTION: Places a red line segment connecting (451, 106) to (87, 132).
; PLAN: r0=451(x1), r1=106(y1), r2=87(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 106
LDI r2, 87
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
