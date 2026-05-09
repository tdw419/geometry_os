; DESCRIPTION: Renders a yellow line between points (19, 174) and (473, 217).
; PLAN: r0=19(x1), r1=174(y1), r2=473(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 174
LDI r2, 473
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
