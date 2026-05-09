; DESCRIPTION: Draws a purple line from (50, 153) to (268, 70).
; PLAN: r0=50(x1), r1=153(y1), r2=268(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 153
LDI r2, 268
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
