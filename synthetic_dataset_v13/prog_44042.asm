; DESCRIPTION: Places a white line segment connecting (94, 127) to (118, 46).
; PLAN: r0=94(x1), r1=127(y1), r2=118(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 127
LDI r2, 118
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
