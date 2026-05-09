; DESCRIPTION: Places a green line segment connecting (212, 216) to (493, 17).
; PLAN: r0=212(x1), r1=216(y1), r2=493(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 216
LDI r2, 493
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
