; DESCRIPTION: Renders a purple line between points (173, 175) and (33, 47).
; PLAN: r0=173(x1), r1=175(y1), r2=33(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 175
LDI r2, 33
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
