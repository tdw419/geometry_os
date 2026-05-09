; DESCRIPTION: Draws a blue line from (27, 92) to (106, 133).
; PLAN: r0=27(x1), r1=92(y1), r2=106(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 92
LDI r2, 106
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
