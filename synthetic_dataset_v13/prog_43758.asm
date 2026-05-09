; DESCRIPTION: Draws a purple line from (421, 129) to (473, 3).
; PLAN: r0=421(x1), r1=129(y1), r2=473(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 129
LDI r2, 473
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
