; DESCRIPTION: Draws a blue line from (14, 34) to (218, 243).
; PLAN: r0=14(x1), r1=34(y1), r2=218(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 34
LDI r2, 218
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
