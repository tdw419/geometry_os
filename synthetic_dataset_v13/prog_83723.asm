; DESCRIPTION: Draws a blue line from (230, 105) to (171, 58).
; PLAN: r0=230(x1), r1=105(y1), r2=171(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 105
LDI r2, 171
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
