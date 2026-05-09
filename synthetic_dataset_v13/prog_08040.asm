; DESCRIPTION: Renders a blue line between points (219, 217) and (166, 197).
; PLAN: r0=219(x1), r1=217(y1), r2=166(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 217
LDI r2, 166
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
