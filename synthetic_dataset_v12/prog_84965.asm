; DESCRIPTION: Places a yellow line segment connecting (250, 95) to (185, 33).
; PLAN: r0=250(x1), r1=95(y1), r2=185(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 95
LDI r2, 185
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
