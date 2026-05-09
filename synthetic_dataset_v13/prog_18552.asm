; DESCRIPTION: Draws a blue line from (166, 136) to (226, 36).
; PLAN: r0=166(x1), r1=136(y1), r2=226(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 136
LDI r2, 226
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
