; DESCRIPTION: Draws a blue line from (3, 48) to (185, 244).
; PLAN: r0=3(x1), r1=48(y1), r2=185(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 48
LDI r2, 185
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
