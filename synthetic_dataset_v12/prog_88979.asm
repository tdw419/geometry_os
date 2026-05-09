; DESCRIPTION: Draws a yellow line from (84, 241) to (219, 69).
; PLAN: r0=84(x1), r1=241(y1), r2=219(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 241
LDI r2, 219
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
