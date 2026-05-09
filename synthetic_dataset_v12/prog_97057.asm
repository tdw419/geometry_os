; DESCRIPTION: Renders a magenta line between points (484, 162) and (278, 237).
; PLAN: r0=484(x1), r1=162(y1), r2=278(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 162
LDI r2, 278
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
