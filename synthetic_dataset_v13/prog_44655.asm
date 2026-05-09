; DESCRIPTION: Renders a purple line between points (45, 15) and (152, 101).
; PLAN: r0=45(x1), r1=15(y1), r2=152(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 15
LDI r2, 152
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
