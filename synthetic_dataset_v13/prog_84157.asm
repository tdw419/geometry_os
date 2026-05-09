; DESCRIPTION: Draws a blue line from (315, 40) to (108, 9).
; PLAN: r0=315(x1), r1=40(y1), r2=108(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 40
LDI r2, 108
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
