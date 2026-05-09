; DESCRIPTION: Draws a blue line from (410, 100) to (86, 85).
; PLAN: r0=410(x1), r1=100(y1), r2=86(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 100
LDI r2, 86
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
