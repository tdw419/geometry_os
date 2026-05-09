; DESCRIPTION: Places a yellow line segment connecting (17, 216) to (383, 50).
; PLAN: r0=17(x1), r1=216(y1), r2=383(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 216
LDI r2, 383
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
