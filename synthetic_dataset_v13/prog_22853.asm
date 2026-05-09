; DESCRIPTION: Renders a purple line between points (391, 86) and (447, 65).
; PLAN: r0=391(x1), r1=86(y1), r2=447(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 86
LDI r2, 447
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
