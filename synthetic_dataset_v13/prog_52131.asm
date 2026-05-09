; DESCRIPTION: Renders a purple line between points (105, 20) and (330, 7).
; PLAN: r0=105(x1), r1=20(y1), r2=330(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 20
LDI r2, 330
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
