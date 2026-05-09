; DESCRIPTION: Renders a purple line between points (349, 215) and (205, 17).
; PLAN: r0=349(x1), r1=215(y1), r2=205(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 215
LDI r2, 205
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
