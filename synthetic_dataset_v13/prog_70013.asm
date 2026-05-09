; DESCRIPTION: Draws a purple line from (319, 66) to (189, 48).
; PLAN: r0=319(x1), r1=66(y1), r2=189(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 66
LDI r2, 189
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
