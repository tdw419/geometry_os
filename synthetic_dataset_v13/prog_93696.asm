; DESCRIPTION: Renders a purple line between points (332, 13) and (296, 205).
; PLAN: r0=332(x1), r1=13(y1), r2=296(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 13
LDI r2, 296
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
