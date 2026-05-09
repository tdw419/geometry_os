; DESCRIPTION: Draws a blue line from (213, 120) to (34, 212).
; PLAN: r0=213(x1), r1=120(y1), r2=34(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 120
LDI r2, 34
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
