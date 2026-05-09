; DESCRIPTION: Renders a purple line between points (265, 5) and (171, 147).
; PLAN: r0=265(x1), r1=5(y1), r2=171(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 5
LDI r2, 171
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
