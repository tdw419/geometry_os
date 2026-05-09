; DESCRIPTION: Draws a blue line from (501, 66) to (491, 236).
; PLAN: r0=501(x1), r1=66(y1), r2=491(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 66
LDI r2, 491
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
