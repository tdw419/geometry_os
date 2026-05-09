; DESCRIPTION: Renders a purple line between points (271, 10) and (391, 96).
; PLAN: r0=271(x1), r1=10(y1), r2=391(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 10
LDI r2, 391
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
