; DESCRIPTION: Draws a blue line from (38, 175) to (364, 152).
; PLAN: r0=38(x1), r1=175(y1), r2=364(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 175
LDI r2, 364
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
