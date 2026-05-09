; DESCRIPTION: Renders a purple line between points (140, 255) and (260, 141).
; PLAN: r0=140(x1), r1=255(y1), r2=260(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 255
LDI r2, 260
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
