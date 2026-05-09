; DESCRIPTION: Draws a blue line from (262, 216) to (475, 89).
; PLAN: r0=262(x1), r1=216(y1), r2=475(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 216
LDI r2, 475
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
