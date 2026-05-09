; DESCRIPTION: Places a yellow line segment connecting (132, 198) to (486, 141).
; PLAN: r0=132(x1), r1=198(y1), r2=486(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 198
LDI r2, 486
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
