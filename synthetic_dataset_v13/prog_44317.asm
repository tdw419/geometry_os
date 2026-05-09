; DESCRIPTION: Places a yellow line segment connecting (43, 232) to (446, 97).
; PLAN: r0=43(x1), r1=232(y1), r2=446(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 232
LDI r2, 446
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
