; DESCRIPTION: Draws a purple line from (180, 85) to (492, 81).
; PLAN: r0=180(x1), r1=85(y1), r2=492(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 85
LDI r2, 492
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
