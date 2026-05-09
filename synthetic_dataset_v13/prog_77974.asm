; DESCRIPTION: Places a yellow line segment connecting (300, 4) to (237, 105).
; PLAN: r0=300(x1), r1=4(y1), r2=237(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 4
LDI r2, 237
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
