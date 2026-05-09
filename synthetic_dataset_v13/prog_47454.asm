; DESCRIPTION: Places a yellow line segment connecting (306, 244) to (147, 149).
; PLAN: r0=306(x1), r1=244(y1), r2=147(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 244
LDI r2, 147
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
