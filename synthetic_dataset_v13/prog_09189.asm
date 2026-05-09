; DESCRIPTION: Draws a blue line from (147, 196) to (492, 1).
; PLAN: r0=147(x1), r1=196(y1), r2=492(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 196
LDI r2, 492
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
