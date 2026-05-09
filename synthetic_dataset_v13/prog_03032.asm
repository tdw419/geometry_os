; DESCRIPTION: Renders a yellow line between points (63, 160) and (315, 74).
; PLAN: r0=63(x1), r1=160(y1), r2=315(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 160
LDI r2, 315
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
