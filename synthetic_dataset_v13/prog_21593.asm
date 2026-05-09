; DESCRIPTION: Draws a purple line from (9, 20) to (420, 142).
; PLAN: r0=9(x1), r1=20(y1), r2=420(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 20
LDI r2, 420
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
