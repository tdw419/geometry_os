; DESCRIPTION: Draws a white line from (501, 84) to (185, 79).
; PLAN: r0=501(x1), r1=84(y1), r2=185(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 84
LDI r2, 185
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
