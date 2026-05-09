; DESCRIPTION: Renders a purple line between points (395, 213) and (494, 162).
; PLAN: r0=395(x1), r1=213(y1), r2=494(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 213
LDI r2, 494
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
