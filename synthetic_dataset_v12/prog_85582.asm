; DESCRIPTION: Places a blue line segment connecting (480, 33) to (115, 198).
; PLAN: r0=480(x1), r1=33(y1), r2=115(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 33
LDI r2, 115
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
