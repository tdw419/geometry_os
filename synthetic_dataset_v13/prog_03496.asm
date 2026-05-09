; DESCRIPTION: Renders a magenta line between points (186, 251) and (328, 142).
; PLAN: r0=186(x1), r1=251(y1), r2=328(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 251
LDI r2, 328
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
