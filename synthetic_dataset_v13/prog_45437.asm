; DESCRIPTION: Renders a purple line between points (407, 198) and (46, 196).
; PLAN: r0=407(x1), r1=198(y1), r2=46(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 198
LDI r2, 46
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
