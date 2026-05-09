; DESCRIPTION: Renders a purple line between points (38, 146) and (192, 23).
; PLAN: r0=38(x1), r1=146(y1), r2=192(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 146
LDI r2, 192
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
