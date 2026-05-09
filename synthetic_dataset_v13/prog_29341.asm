; DESCRIPTION: Places a yellow line segment connecting (424, 181) to (149, 108).
; PLAN: r0=424(x1), r1=181(y1), r2=149(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 181
LDI r2, 149
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
