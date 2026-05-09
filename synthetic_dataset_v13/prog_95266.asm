; DESCRIPTION: Draws a blue line from (416, 178) to (374, 100).
; PLAN: r0=416(x1), r1=178(y1), r2=374(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 178
LDI r2, 374
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
