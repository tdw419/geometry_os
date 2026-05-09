; DESCRIPTION: Renders a blue line between points (186, 186) and (236, 94).
; PLAN: r0=186(x1), r1=186(y1), r2=236(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 186
LDI r2, 236
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
