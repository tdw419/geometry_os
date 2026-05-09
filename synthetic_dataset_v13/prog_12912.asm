; DESCRIPTION: Draws a blue line from (85, 145) to (167, 94).
; PLAN: r0=85(x1), r1=145(y1), r2=167(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 145
LDI r2, 167
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
