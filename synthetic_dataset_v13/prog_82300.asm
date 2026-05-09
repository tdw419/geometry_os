; DESCRIPTION: Places a blue line segment connecting (385, 216) to (480, 198).
; PLAN: r0=385(x1), r1=216(y1), r2=480(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 216
LDI r2, 480
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
