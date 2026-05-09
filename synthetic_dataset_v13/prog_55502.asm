; DESCRIPTION: Renders a magenta line between points (435, 147) and (221, 225).
; PLAN: r0=435(x1), r1=147(y1), r2=221(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 147
LDI r2, 221
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
