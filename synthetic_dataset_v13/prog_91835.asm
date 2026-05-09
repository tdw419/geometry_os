; DESCRIPTION: Draws a purple line from (306, 78) to (168, 211).
; PLAN: r0=306(x1), r1=78(y1), r2=168(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 78
LDI r2, 168
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
