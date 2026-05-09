; DESCRIPTION: Renders a purple line between points (361, 58) and (183, 127).
; PLAN: r0=361(x1), r1=58(y1), r2=183(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 58
LDI r2, 183
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
