; DESCRIPTION: Draws a blue line from (26, 85) to (59, 248).
; PLAN: r0=26(x1), r1=85(y1), r2=59(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 85
LDI r2, 59
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
