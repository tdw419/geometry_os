; DESCRIPTION: Renders a purple line between points (57, 38) and (33, 65).
; PLAN: r0=57(x1), r1=38(y1), r2=33(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 38
LDI r2, 33
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
