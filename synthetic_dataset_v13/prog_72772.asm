; DESCRIPTION: Draws a blue line from (404, 142) to (131, 153).
; PLAN: r0=404(x1), r1=142(y1), r2=131(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 142
LDI r2, 131
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
