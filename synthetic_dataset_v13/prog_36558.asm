; DESCRIPTION: Places a blue line segment connecting (435, 99) to (206, 79).
; PLAN: r0=435(x1), r1=99(y1), r2=206(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 99
LDI r2, 206
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
