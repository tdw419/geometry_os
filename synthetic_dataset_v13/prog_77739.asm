; DESCRIPTION: Draws a blue line from (16, 198) to (324, 148).
; PLAN: r0=16(x1), r1=198(y1), r2=324(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 198
LDI r2, 324
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
