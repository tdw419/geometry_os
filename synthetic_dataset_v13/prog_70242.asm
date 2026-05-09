; DESCRIPTION: Draws a orange line from (322, 252) to (200, 64).
; PLAN: r0=322(x1), r1=252(y1), r2=200(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 252
LDI r2, 200
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
