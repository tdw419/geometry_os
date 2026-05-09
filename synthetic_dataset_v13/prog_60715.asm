; DESCRIPTION: Places a yellow line segment connecting (97, 25) to (416, 67).
; PLAN: r0=97(x1), r1=25(y1), r2=416(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 25
LDI r2, 416
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
