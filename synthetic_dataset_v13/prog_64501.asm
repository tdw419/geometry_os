; DESCRIPTION: Draws a purple line from (165, 29) to (360, 102).
; PLAN: r0=165(x1), r1=29(y1), r2=360(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 29
LDI r2, 360
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
