; DESCRIPTION: Places a yellow line segment connecting (279, 22) to (340, 35).
; PLAN: r0=279(x1), r1=22(y1), r2=340(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 22
LDI r2, 340
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
