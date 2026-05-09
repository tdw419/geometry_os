; DESCRIPTION: Draws a blue line from (501, 214) to (77, 95).
; PLAN: r0=501(x1), r1=214(y1), r2=77(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 214
LDI r2, 77
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
