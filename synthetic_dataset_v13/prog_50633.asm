; DESCRIPTION: Renders a purple line between points (296, 195) and (349, 175).
; PLAN: r0=296(x1), r1=195(y1), r2=349(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 195
LDI r2, 349
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
