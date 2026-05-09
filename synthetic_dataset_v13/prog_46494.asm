; DESCRIPTION: Draws a blue line from (424, 32) to (366, 211).
; PLAN: r0=424(x1), r1=32(y1), r2=366(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 32
LDI r2, 366
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
