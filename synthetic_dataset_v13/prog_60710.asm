; DESCRIPTION: Draws a blue line from (350, 2) to (40, 25).
; PLAN: r0=350(x1), r1=2(y1), r2=40(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 2
LDI r2, 40
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
