; DESCRIPTION: Renders a black line between points (188, 70) and (237, 66).
; PLAN: r0=188(x1), r1=70(y1), r2=237(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 70
LDI r2, 237
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
