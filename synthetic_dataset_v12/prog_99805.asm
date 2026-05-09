; DESCRIPTION: Draws a purple line from (430, 134) to (264, 63).
; PLAN: r0=430(x1), r1=134(y1), r2=264(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 134
LDI r2, 264
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
