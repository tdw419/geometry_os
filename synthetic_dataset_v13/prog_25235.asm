; DESCRIPTION: Places a blue line segment connecting (105, 99) to (8, 207).
; PLAN: r0=105(x1), r1=99(y1), r2=8(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 99
LDI r2, 8
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
