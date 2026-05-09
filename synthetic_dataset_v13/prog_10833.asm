; DESCRIPTION: Renders a purple line between points (85, 4) and (124, 166).
; PLAN: r0=85(x1), r1=4(y1), r2=124(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 4
LDI r2, 124
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
