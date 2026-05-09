; DESCRIPTION: Renders a blue line between points (17, 196) and (444, 2).
; PLAN: r0=17(x1), r1=196(y1), r2=444(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 196
LDI r2, 444
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
