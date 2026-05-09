; DESCRIPTION: Renders a blue line between points (272, 21) and (186, 137).
; PLAN: r0=272(x1), r1=21(y1), r2=186(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 21
LDI r2, 186
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
