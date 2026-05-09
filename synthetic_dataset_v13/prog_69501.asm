; DESCRIPTION: Draws a blue line from (266, 235) to (377, 226).
; PLAN: r0=266(x1), r1=235(y1), r2=377(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 235
LDI r2, 377
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
