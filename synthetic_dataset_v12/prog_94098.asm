; DESCRIPTION: Draws a purple line from (98, 1) to (175, 63).
; PLAN: r0=98(x1), r1=1(y1), r2=175(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 1
LDI r2, 175
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
