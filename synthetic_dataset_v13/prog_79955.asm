; DESCRIPTION: Renders a purple line between points (3, 229) and (391, 100).
; PLAN: r0=3(x1), r1=229(y1), r2=391(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 229
LDI r2, 391
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
