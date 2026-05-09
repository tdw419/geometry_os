; DESCRIPTION: Draws a blue line from (182, 216) to (270, 159).
; PLAN: r0=182(x1), r1=216(y1), r2=270(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 216
LDI r2, 270
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
