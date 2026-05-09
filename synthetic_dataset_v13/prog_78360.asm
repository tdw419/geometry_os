; DESCRIPTION: Draws a purple line from (341, 0) to (191, 33).
; PLAN: r0=341(x1), r1=0(y1), r2=191(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 0
LDI r2, 191
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
