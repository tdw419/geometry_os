; DESCRIPTION: Places a blue line segment connecting (115, 192) to (280, 207).
; PLAN: r0=115(x1), r1=192(y1), r2=280(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 192
LDI r2, 280
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
