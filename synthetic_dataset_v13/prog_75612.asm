; DESCRIPTION: Renders a blue line between points (81, 17) and (349, 196).
; PLAN: r0=81(x1), r1=17(y1), r2=349(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 17
LDI r2, 349
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
