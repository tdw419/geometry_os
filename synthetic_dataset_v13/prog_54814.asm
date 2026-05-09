; DESCRIPTION: Renders a purple line between points (172, 9) and (175, 196).
; PLAN: r0=172(x1), r1=9(y1), r2=175(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 9
LDI r2, 175
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
