; DESCRIPTION: Draws a blue line from (31, 122) to (29, 92).
; PLAN: r0=31(x1), r1=122(y1), r2=29(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 122
LDI r2, 29
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
