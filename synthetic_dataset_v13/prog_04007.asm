; DESCRIPTION: Places a white line segment connecting (127, 118) to (155, 34).
; PLAN: r0=127(x1), r1=118(y1), r2=155(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 118
LDI r2, 155
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
