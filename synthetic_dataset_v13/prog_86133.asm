; DESCRIPTION: Places a yellow line segment connecting (315, 1) to (112, 231).
; PLAN: r0=315(x1), r1=1(y1), r2=112(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 1
LDI r2, 112
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
