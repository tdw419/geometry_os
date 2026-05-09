; DESCRIPTION: Places a yellow line segment connecting (83, 222) to (363, 243).
; PLAN: r0=83(x1), r1=222(y1), r2=363(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 222
LDI r2, 363
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
