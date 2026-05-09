; DESCRIPTION: Draws a blue line from (67, 180) to (484, 243).
; PLAN: r0=67(x1), r1=180(y1), r2=484(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 180
LDI r2, 484
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
