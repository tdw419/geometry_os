; DESCRIPTION: Draws a blue line from (500, 33) to (359, 172).
; PLAN: r0=500(x1), r1=33(y1), r2=359(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 33
LDI r2, 359
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
