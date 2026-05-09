; DESCRIPTION: Renders a blue line between points (17, 218) and (236, 114).
; PLAN: r0=17(x1), r1=218(y1), r2=236(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 218
LDI r2, 236
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
