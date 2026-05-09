; DESCRIPTION: Places a green line segment connecting (108, 167) to (363, 145).
; PLAN: r0=108(x1), r1=167(y1), r2=363(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 167
LDI r2, 363
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
