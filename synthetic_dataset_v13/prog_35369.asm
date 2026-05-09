; DESCRIPTION: Draws a purple line from (6, 66) to (50, 73).
; PLAN: r0=6(x1), r1=66(y1), r2=50(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 66
LDI r2, 50
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
