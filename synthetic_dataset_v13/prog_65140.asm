; DESCRIPTION: Draws a blue line from (271, 192) to (37, 137).
; PLAN: r0=271(x1), r1=192(y1), r2=37(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 192
LDI r2, 37
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
