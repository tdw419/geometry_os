; DESCRIPTION: Draws a black line from (495, 84) to (205, 155).
; PLAN: r0=495(x1), r1=84(y1), r2=205(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 84
LDI r2, 205
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
