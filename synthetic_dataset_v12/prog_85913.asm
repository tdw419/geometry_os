; DESCRIPTION: Draws a yellow line from (140, 80) to (227, 150).
; PLAN: r0=140(x1), r1=80(y1), r2=227(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 80
LDI r2, 227
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
