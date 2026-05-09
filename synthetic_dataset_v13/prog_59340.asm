; DESCRIPTION: Draws a blue line from (139, 86) to (505, 222).
; PLAN: r0=139(x1), r1=86(y1), r2=505(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 86
LDI r2, 505
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
