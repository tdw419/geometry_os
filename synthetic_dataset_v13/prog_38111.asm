; DESCRIPTION: Draws a blue line from (428, 88) to (71, 22).
; PLAN: r0=428(x1), r1=88(y1), r2=71(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 88
LDI r2, 71
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
