; DESCRIPTION: Draws a blue line from (108, 15) to (220, 168).
; PLAN: r0=108(x1), r1=15(y1), r2=220(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 15
LDI r2, 220
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
