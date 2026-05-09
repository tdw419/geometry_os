; DESCRIPTION: Renders a purple line between points (164, 181) and (137, 150).
; PLAN: r0=164(x1), r1=181(y1), r2=137(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 181
LDI r2, 137
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
