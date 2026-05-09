; DESCRIPTION: Draws a blue line from (492, 136) to (30, 15).
; PLAN: r0=492(x1), r1=136(y1), r2=30(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 136
LDI r2, 30
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
