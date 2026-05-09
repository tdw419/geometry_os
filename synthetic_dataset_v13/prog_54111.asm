; DESCRIPTION: Draws a blue line from (11, 59) to (248, 158).
; PLAN: r0=11(x1), r1=59(y1), r2=248(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 59
LDI r2, 248
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
