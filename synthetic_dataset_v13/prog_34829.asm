; DESCRIPTION: Renders a purple line between points (480, 198) and (144, 92).
; PLAN: r0=480(x1), r1=198(y1), r2=144(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 198
LDI r2, 144
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
