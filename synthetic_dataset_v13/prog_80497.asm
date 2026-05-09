; DESCRIPTION: Places a green line segment connecting (22, 229) to (58, 158).
; PLAN: r0=22(x1), r1=229(y1), r2=58(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 229
LDI r2, 58
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
