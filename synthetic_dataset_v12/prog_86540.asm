; DESCRIPTION: Renders a purple line between points (350, 92) and (96, 179).
; PLAN: r0=350(x1), r1=92(y1), r2=96(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 92
LDI r2, 96
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
