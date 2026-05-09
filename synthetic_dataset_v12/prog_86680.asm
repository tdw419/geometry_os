; DESCRIPTION: Places a green line segment connecting (388, 219) to (363, 40).
; PLAN: r0=388(x1), r1=219(y1), r2=363(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 219
LDI r2, 363
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
