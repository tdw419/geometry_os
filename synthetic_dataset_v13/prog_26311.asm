; DESCRIPTION: Draws a blue line from (321, 162) to (112, 65).
; PLAN: r0=321(x1), r1=162(y1), r2=112(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 162
LDI r2, 112
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
