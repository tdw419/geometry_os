; DESCRIPTION: Draws a green line from (80, 160) to (315, 227).
; PLAN: r0=80(x1), r1=160(y1), r2=315(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 160
LDI r2, 315
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
