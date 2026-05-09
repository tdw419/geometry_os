; DESCRIPTION: Renders a yellow line between points (229, 84) and (198, 156).
; PLAN: r0=229(x1), r1=84(y1), r2=198(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 84
LDI r2, 198
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
