; DESCRIPTION: Draws a blue line from (118, 254) to (68, 69).
; PLAN: r0=118(x1), r1=254(y1), r2=68(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 254
LDI r2, 68
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
