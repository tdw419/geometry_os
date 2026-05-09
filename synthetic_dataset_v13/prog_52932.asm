; DESCRIPTION: Draws a purple line from (12, 105) to (338, 108).
; PLAN: r0=12(x1), r1=105(y1), r2=338(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 105
LDI r2, 338
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
