; DESCRIPTION: Draws a purple line from (378, 129) to (262, 206).
; PLAN: r0=378(x1), r1=129(y1), r2=262(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 129
LDI r2, 262
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
