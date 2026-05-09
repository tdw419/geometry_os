; DESCRIPTION: Draws a blue line from (423, 136) to (380, 171).
; PLAN: r0=423(x1), r1=136(y1), r2=380(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 136
LDI r2, 380
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
