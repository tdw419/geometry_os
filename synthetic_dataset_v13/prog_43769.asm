; DESCRIPTION: Draws a blue line from (50, 70) to (227, 39).
; PLAN: r0=50(x1), r1=70(y1), r2=227(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 70
LDI r2, 227
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
