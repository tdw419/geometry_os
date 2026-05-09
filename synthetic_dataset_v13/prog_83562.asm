; DESCRIPTION: Draws a purple line from (87, 70) to (77, 73).
; PLAN: r0=87(x1), r1=70(y1), r2=77(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 70
LDI r2, 77
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
