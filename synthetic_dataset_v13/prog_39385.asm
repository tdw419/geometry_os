; DESCRIPTION: Renders a purple line between points (123, 213) and (248, 23).
; PLAN: r0=123(x1), r1=213(y1), r2=248(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 213
LDI r2, 248
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
