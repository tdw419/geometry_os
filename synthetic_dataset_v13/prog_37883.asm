; DESCRIPTION: Renders a purple line between points (79, 86) and (412, 45).
; PLAN: r0=79(x1), r1=86(y1), r2=412(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 86
LDI r2, 412
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
