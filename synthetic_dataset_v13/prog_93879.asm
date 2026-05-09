; DESCRIPTION: Renders a black line between points (21, 236) and (133, 188).
; PLAN: r0=21(x1), r1=236(y1), r2=133(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 236
LDI r2, 133
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
