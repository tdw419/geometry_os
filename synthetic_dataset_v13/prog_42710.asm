; DESCRIPTION: Draws a purple line from (278, 225) to (328, 36).
; PLAN: r0=278(x1), r1=225(y1), r2=328(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 225
LDI r2, 328
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
