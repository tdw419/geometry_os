; DESCRIPTION: Renders a magenta line between points (505, 144) and (186, 233).
; PLAN: r0=505(x1), r1=144(y1), r2=186(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 144
LDI r2, 186
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
