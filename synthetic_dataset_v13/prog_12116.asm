; DESCRIPTION: Draws a purple line from (79, 55) to (113, 94).
; PLAN: r0=79(x1), r1=55(y1), r2=113(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 55
LDI r2, 113
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
