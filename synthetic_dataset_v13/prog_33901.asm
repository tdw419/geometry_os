; DESCRIPTION: Places a green line segment connecting (99, 119) to (133, 243).
; PLAN: r0=99(x1), r1=119(y1), r2=133(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 119
LDI r2, 133
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
