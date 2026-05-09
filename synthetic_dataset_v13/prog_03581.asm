; DESCRIPTION: Renders a magenta line between points (137, 137) and (342, 197).
; PLAN: r0=137(x1), r1=137(y1), r2=342(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 137
LDI r2, 342
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
