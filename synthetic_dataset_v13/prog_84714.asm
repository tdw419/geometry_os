; DESCRIPTION: Renders a purple line between points (264, 206) and (492, 217).
; PLAN: r0=264(x1), r1=206(y1), r2=492(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 206
LDI r2, 492
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
