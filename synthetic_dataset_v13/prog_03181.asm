; DESCRIPTION: Draws a blue line from (109, 144) to (165, 197).
; PLAN: r0=109(x1), r1=144(y1), r2=165(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 144
LDI r2, 165
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
