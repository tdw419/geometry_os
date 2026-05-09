; DESCRIPTION: Draws a blue line from (153, 252) to (19, 64).
; PLAN: r0=153(x1), r1=252(y1), r2=19(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 252
LDI r2, 19
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
