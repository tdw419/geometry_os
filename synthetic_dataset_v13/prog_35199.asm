; DESCRIPTION: Draws a blue line from (156, 162) to (423, 225).
; PLAN: r0=156(x1), r1=162(y1), r2=423(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 162
LDI r2, 423
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
