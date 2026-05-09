; DESCRIPTION: Renders a magenta line between points (197, 97) and (453, 155).
; PLAN: r0=197(x1), r1=97(y1), r2=453(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 97
LDI r2, 453
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
