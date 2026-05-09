; DESCRIPTION: Renders a blue line between points (219, 78) and (17, 28).
; PLAN: r0=219(x1), r1=78(y1), r2=17(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 78
LDI r2, 17
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
