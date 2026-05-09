; DESCRIPTION: Renders a purple line between points (202, 122) and (78, 165).
; PLAN: r0=202(x1), r1=122(y1), r2=78(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 122
LDI r2, 78
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
