; DESCRIPTION: Renders a purple line between points (70, 86) and (248, 246).
; PLAN: r0=70(x1), r1=86(y1), r2=248(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 86
LDI r2, 248
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
