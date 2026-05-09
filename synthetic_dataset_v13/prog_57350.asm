; DESCRIPTION: Draws a purple line from (39, 11) to (85, 63).
; PLAN: r0=39(x1), r1=11(y1), r2=85(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 11
LDI r2, 85
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
