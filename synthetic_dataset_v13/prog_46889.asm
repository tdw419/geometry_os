; DESCRIPTION: Draws a purple line from (113, 88) to (186, 16).
; PLAN: r0=113(x1), r1=88(y1), r2=186(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 88
LDI r2, 186
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
