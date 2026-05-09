; DESCRIPTION: Draws a purple line from (95, 76) to (375, 19).
; PLAN: r0=95(x1), r1=76(y1), r2=375(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 76
LDI r2, 375
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
