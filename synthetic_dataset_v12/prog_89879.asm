; DESCRIPTION: Renders a purple line between points (114, 44) and (70, 109).
; PLAN: r0=114(x1), r1=44(y1), r2=70(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 44
LDI r2, 70
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
