; DESCRIPTION: Draws a blue line from (287, 64) to (252, 227).
; PLAN: r0=287(x1), r1=64(y1), r2=252(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 64
LDI r2, 252
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
