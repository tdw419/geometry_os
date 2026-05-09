; DESCRIPTION: Draws a blue line from (108, 93) to (477, 2).
; PLAN: r0=108(x1), r1=93(y1), r2=477(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 93
LDI r2, 477
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
