; DESCRIPTION: Draws a blue line from (166, 153) to (136, 206).
; PLAN: r0=166(x1), r1=153(y1), r2=136(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 153
LDI r2, 136
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
