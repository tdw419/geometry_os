; DESCRIPTION: Draws a blue line from (416, 192) to (91, 179).
; PLAN: r0=416(x1), r1=192(y1), r2=91(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 192
LDI r2, 91
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
