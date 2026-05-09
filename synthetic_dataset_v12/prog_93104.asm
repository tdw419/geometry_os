; DESCRIPTION: Places a blue line segment connecting (124, 198) to (9, 243).
; PLAN: r0=124(x1), r1=198(y1), r2=9(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 198
LDI r2, 9
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
