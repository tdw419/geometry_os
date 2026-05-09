; DESCRIPTION: Draws a blue line from (93, 60) to (230, 138).
; PLAN: r0=93(x1), r1=60(y1), r2=230(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 60
LDI r2, 230
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
