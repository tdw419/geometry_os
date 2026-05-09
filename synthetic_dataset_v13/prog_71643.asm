; DESCRIPTION: Places a magenta line segment connecting (315, 198) to (256, 137).
; PLAN: r0=315(x1), r1=198(y1), r2=256(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 198
LDI r2, 256
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
