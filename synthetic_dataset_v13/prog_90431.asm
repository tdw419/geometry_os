; DESCRIPTION: Draws a blue line from (76, 95) to (389, 55).
; PLAN: r0=76(x1), r1=95(y1), r2=389(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 95
LDI r2, 389
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
