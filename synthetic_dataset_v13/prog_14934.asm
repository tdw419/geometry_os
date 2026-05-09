; DESCRIPTION: Renders a purple line between points (470, 41) and (140, 249).
; PLAN: r0=470(x1), r1=41(y1), r2=140(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 41
LDI r2, 140
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
