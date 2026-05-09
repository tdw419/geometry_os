; DESCRIPTION: Places a green line segment connecting (391, 181) to (149, 5).
; PLAN: r0=391(x1), r1=181(y1), r2=149(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 181
LDI r2, 149
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
