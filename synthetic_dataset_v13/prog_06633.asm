; DESCRIPTION: Places a yellow line segment connecting (3, 216) to (283, 243).
; PLAN: r0=3(x1), r1=216(y1), r2=283(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 216
LDI r2, 283
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
