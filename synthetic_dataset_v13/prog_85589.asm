; DESCRIPTION: Renders a yellow line between points (219, 18) and (484, 175).
; PLAN: r0=219(x1), r1=18(y1), r2=484(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 18
LDI r2, 484
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
