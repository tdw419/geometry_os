; DESCRIPTION: Draws a blue line from (31, 36) to (337, 243).
; PLAN: r0=31(x1), r1=36(y1), r2=337(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 36
LDI r2, 337
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
