; DESCRIPTION: Draws a purple line from (255, 170) to (30, 204).
; PLAN: r0=255(x1), r1=170(y1), r2=30(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 170
LDI r2, 30
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
