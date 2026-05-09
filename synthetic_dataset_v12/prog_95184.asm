; DESCRIPTION: Places a blue line segment connecting (28, 255) to (33, 216).
; PLAN: r0=28(x1), r1=255(y1), r2=33(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 255
LDI r2, 33
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
