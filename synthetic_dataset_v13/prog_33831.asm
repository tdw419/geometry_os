; DESCRIPTION: Places a yellow line segment connecting (432, 195) to (142, 59).
; PLAN: r0=432(x1), r1=195(y1), r2=142(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 195
LDI r2, 142
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
