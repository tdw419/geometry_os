; DESCRIPTION: Draws a purple line from (364, 53) to (138, 195).
; PLAN: r0=364(x1), r1=53(y1), r2=138(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 53
LDI r2, 138
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
