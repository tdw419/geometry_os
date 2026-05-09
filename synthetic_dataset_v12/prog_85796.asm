; DESCRIPTION: Draws a blue line from (148, 75) to (17, 153).
; PLAN: r0=148(x1), r1=75(y1), r2=17(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 75
LDI r2, 17
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
