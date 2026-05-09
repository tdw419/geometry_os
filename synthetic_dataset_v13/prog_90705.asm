; DESCRIPTION: Draws a yellow line from (350, 90) to (300, 155).
; PLAN: r0=350(x1), r1=90(y1), r2=300(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 90
LDI r2, 300
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
