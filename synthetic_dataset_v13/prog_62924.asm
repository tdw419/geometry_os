; DESCRIPTION: Draws a purple line from (454, 129) to (435, 127).
; PLAN: r0=454(x1), r1=129(y1), r2=435(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 129
LDI r2, 435
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
