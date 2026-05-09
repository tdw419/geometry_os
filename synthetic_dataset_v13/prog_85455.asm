; DESCRIPTION: Places a yellow line segment connecting (385, 187) to (332, 145).
; PLAN: r0=385(x1), r1=187(y1), r2=332(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 187
LDI r2, 332
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
