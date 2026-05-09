; DESCRIPTION: Draws a purple line from (170, 7) to (248, 21).
; PLAN: r0=170(x1), r1=7(y1), r2=248(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 7
LDI r2, 248
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
