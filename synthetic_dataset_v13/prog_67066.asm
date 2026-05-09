; DESCRIPTION: Places a purple line segment connecting (91, 229) to (221, 161).
; PLAN: r0=91(x1), r1=229(y1), r2=221(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 229
LDI r2, 221
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
