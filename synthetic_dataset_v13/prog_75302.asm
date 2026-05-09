; DESCRIPTION: Renders a yellow line between points (135, 189) and (97, 219).
; PLAN: r0=135(x1), r1=189(y1), r2=97(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 189
LDI r2, 97
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
