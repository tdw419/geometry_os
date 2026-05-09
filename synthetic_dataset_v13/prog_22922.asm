; DESCRIPTION: Renders a purple line between points (182, 17) and (480, 59).
; PLAN: r0=182(x1), r1=17(y1), r2=480(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 17
LDI r2, 480
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
