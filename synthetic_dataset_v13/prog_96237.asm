; DESCRIPTION: Renders a blue line between points (418, 181) and (166, 106).
; PLAN: r0=418(x1), r1=181(y1), r2=166(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 181
LDI r2, 166
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
