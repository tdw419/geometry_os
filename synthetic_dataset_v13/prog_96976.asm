; DESCRIPTION: Draws a blue line from (501, 10) to (270, 1).
; PLAN: r0=501(x1), r1=10(y1), r2=270(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 10
LDI r2, 270
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
