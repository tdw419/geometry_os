; DESCRIPTION: Renders a purple line between points (55, 38) and (454, 126).
; PLAN: r0=55(x1), r1=38(y1), r2=454(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 38
LDI r2, 454
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
