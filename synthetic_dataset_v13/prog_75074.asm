; DESCRIPTION: Draws a magenta line from (387, 137) to (136, 129).
; PLAN: r0=387(x1), r1=137(y1), r2=136(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 137
LDI r2, 136
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
