; DESCRIPTION: Places a yellow line segment connecting (353, 97) to (371, 209).
; PLAN: r0=353(x1), r1=97(y1), r2=371(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 97
LDI r2, 371
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
