; DESCRIPTION: Draws a blue line from (93, 232) to (13, 164).
; PLAN: r0=93(x1), r1=232(y1), r2=13(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 232
LDI r2, 13
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
