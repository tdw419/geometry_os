; DESCRIPTION: Draws a blue line from (136, 23) to (338, 9).
; PLAN: r0=136(x1), r1=23(y1), r2=338(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 23
LDI r2, 338
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
