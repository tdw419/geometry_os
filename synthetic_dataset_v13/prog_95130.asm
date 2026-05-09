; DESCRIPTION: Renders a blue line between points (430, 183) and (473, 172).
; PLAN: r0=430(x1), r1=183(y1), r2=473(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 183
LDI r2, 473
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
