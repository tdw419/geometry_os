; DESCRIPTION: Draws a blue line from (400, 17) to (149, 16).
; PLAN: r0=400(x1), r1=17(y1), r2=149(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 17
LDI r2, 149
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
