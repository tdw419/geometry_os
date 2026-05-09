; DESCRIPTION: Renders a purple line between points (302, 132) and (265, 88).
; PLAN: r0=302(x1), r1=132(y1), r2=265(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 132
LDI r2, 265
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
