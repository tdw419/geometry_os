; DESCRIPTION: Draws a purple line from (342, 176) to (86, 123).
; PLAN: r0=342(x1), r1=176(y1), r2=86(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 176
LDI r2, 86
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
