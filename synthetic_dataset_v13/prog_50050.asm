; DESCRIPTION: Draws a blue line from (79, 142) to (79, 230).
; PLAN: r0=79(x1), r1=142(y1), r2=79(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 142
LDI r2, 79
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
