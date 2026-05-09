; DESCRIPTION: Draws a blue line from (461, 121) to (236, 19).
; PLAN: r0=461(x1), r1=121(y1), r2=236(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 121
LDI r2, 236
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
