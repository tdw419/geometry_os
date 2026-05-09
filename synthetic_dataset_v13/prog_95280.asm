; DESCRIPTION: Draws a blue line from (315, 91) to (400, 189).
; PLAN: r0=315(x1), r1=91(y1), r2=400(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 91
LDI r2, 400
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
