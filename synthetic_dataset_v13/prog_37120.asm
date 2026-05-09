; DESCRIPTION: Draws a blue line from (130, 244) to (19, 75).
; PLAN: r0=130(x1), r1=244(y1), r2=19(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 244
LDI r2, 19
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
