; DESCRIPTION: Draws a purple line from (71, 153) to (122, 37).
; PLAN: r0=71(x1), r1=153(y1), r2=122(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 153
LDI r2, 122
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
