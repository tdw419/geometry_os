; DESCRIPTION: Draws a blue line from (331, 174) to (69, 226).
; PLAN: r0=331(x1), r1=174(y1), r2=69(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 174
LDI r2, 69
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
