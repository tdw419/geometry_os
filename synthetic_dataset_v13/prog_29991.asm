; DESCRIPTION: Draws a purple line from (328, 3) to (420, 127).
; PLAN: r0=328(x1), r1=3(y1), r2=420(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 3
LDI r2, 420
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
