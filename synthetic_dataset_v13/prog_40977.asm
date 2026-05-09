; DESCRIPTION: Places a blue line segment connecting (286, 97) to (192, 207).
; PLAN: r0=286(x1), r1=97(y1), r2=192(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 97
LDI r2, 192
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
