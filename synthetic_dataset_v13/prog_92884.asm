; DESCRIPTION: Draws a blue line from (453, 245) to (196, 217).
; PLAN: r0=453(x1), r1=245(y1), r2=196(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 245
LDI r2, 196
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
