; DESCRIPTION: Draws a blue line from (85, 226) to (363, 129).
; PLAN: r0=85(x1), r1=226(y1), r2=363(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 226
LDI r2, 363
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
