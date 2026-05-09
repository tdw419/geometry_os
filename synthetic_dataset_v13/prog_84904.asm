; DESCRIPTION: Draws a blue line from (95, 199) to (475, 1).
; PLAN: r0=95(x1), r1=199(y1), r2=475(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 199
LDI r2, 475
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
