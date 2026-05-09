; DESCRIPTION: Places a yellow line segment connecting (350, 251) to (258, 19).
; PLAN: r0=350(x1), r1=251(y1), r2=258(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 251
LDI r2, 258
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
