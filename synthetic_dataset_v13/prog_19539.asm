; DESCRIPTION: Draws a blue line from (453, 138) to (99, 193).
; PLAN: r0=453(x1), r1=138(y1), r2=99(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 138
LDI r2, 99
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
