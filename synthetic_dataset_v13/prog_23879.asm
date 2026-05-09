; DESCRIPTION: Places a green line segment connecting (147, 216) to (71, 70).
; PLAN: r0=147(x1), r1=216(y1), r2=71(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 216
LDI r2, 71
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
