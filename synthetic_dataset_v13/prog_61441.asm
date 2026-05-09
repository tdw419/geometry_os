; DESCRIPTION: Renders a yellow line between points (341, 212) and (137, 180).
; PLAN: r0=341(x1), r1=212(y1), r2=137(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 212
LDI r2, 137
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
