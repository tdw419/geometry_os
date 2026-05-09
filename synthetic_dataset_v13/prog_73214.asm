; DESCRIPTION: Renders a purple line between points (189, 137) and (225, 65).
; PLAN: r0=189(x1), r1=137(y1), r2=225(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 137
LDI r2, 225
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
