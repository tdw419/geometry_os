; DESCRIPTION: Renders a yellow line between points (63, 124) and (96, 155).
; PLAN: r0=63(x1), r1=124(y1), r2=96(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 124
LDI r2, 96
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
