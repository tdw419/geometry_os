; DESCRIPTION: Renders a yellow line between points (143, 229) and (84, 15).
; PLAN: r0=143(x1), r1=229(y1), r2=84(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 229
LDI r2, 84
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
