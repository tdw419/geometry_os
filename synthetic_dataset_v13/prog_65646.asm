; DESCRIPTION: Draws a black line from (190, 136) to (72, 84).
; PLAN: r0=190(x1), r1=136(y1), r2=72(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 136
LDI r2, 72
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
