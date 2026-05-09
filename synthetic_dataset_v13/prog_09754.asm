; DESCRIPTION: Places a blue line segment connecting (328, 40) to (216, 117).
; PLAN: r0=328(x1), r1=40(y1), r2=216(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 40
LDI r2, 216
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
