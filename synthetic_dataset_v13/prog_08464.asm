; DESCRIPTION: Draws a purple line from (299, 233) to (350, 85).
; PLAN: r0=299(x1), r1=233(y1), r2=350(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 233
LDI r2, 350
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
