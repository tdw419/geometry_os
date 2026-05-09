; DESCRIPTION: Renders a blue line between points (366, 204) and (278, 205).
; PLAN: r0=366(x1), r1=204(y1), r2=278(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 204
LDI r2, 278
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
