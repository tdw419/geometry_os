; DESCRIPTION: Draws a blue line from (110, 22) to (255, 141).
; PLAN: r0=110(x1), r1=22(y1), r2=255(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 22
LDI r2, 255
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
