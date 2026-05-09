; DESCRIPTION: Places a yellow line segment connecting (135, 122) to (323, 55).
; PLAN: r0=135(x1), r1=122(y1), r2=323(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 122
LDI r2, 323
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
