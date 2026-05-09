; DESCRIPTION: Draws a purple line from (303, 194) to (52, 129).
; PLAN: r0=303(x1), r1=194(y1), r2=52(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 194
LDI r2, 52
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
