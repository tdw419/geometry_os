; DESCRIPTION: Places a blue line segment connecting (119, 226) to (453, 174).
; PLAN: r0=119(x1), r1=226(y1), r2=453(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 226
LDI r2, 453
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
