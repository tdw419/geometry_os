; DESCRIPTION: Places a yellow line segment connecting (493, 34) to (35, 130).
; PLAN: r0=493(x1), r1=34(y1), r2=35(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 34
LDI r2, 35
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
