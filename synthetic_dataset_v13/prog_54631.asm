; DESCRIPTION: Draws a blue line from (238, 75) to (35, 46).
; PLAN: r0=238(x1), r1=75(y1), r2=35(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 75
LDI r2, 35
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
