; DESCRIPTION: Places a yellow line segment connecting (315, 70) to (22, 117).
; PLAN: r0=315(x1), r1=70(y1), r2=22(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 70
LDI r2, 22
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
