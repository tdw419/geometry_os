; DESCRIPTION: Draws a blue line from (244, 95) to (93, 5).
; PLAN: r0=244(x1), r1=95(y1), r2=93(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 95
LDI r2, 93
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
