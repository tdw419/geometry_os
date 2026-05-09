; DESCRIPTION: Renders a blue line between points (223, 193) and (246, 188).
; PLAN: r0=223(x1), r1=193(y1), r2=246(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 193
LDI r2, 246
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
