; DESCRIPTION: Draws a blue line from (129, 225) to (179, 133).
; PLAN: r0=129(x1), r1=225(y1), r2=179(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 225
LDI r2, 179
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
