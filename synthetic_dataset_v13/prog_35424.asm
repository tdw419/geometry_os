; DESCRIPTION: Draws a blue line from (453, 69) to (79, 98).
; PLAN: r0=453(x1), r1=69(y1), r2=79(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 69
LDI r2, 79
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
