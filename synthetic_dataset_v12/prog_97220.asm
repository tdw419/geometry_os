; DESCRIPTION: Places a blue line segment connecting (191, 34) to (445, 158).
; PLAN: r0=191(x1), r1=34(y1), r2=445(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 34
LDI r2, 445
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
