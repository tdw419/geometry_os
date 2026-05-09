; DESCRIPTION: Draws a purple line from (360, 60) to (40, 77).
; PLAN: r0=360(x1), r1=60(y1), r2=40(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 60
LDI r2, 40
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
