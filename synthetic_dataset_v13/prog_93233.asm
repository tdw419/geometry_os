; DESCRIPTION: Places a yellow line segment connecting (363, 186) to (52, 227).
; PLAN: r0=363(x1), r1=186(y1), r2=52(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 186
LDI r2, 52
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
