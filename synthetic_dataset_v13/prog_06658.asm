; DESCRIPTION: Draws a purple line from (332, 85) to (154, 41).
; PLAN: r0=332(x1), r1=85(y1), r2=154(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 85
LDI r2, 154
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
