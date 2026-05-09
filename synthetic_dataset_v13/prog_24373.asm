; DESCRIPTION: Draws a purple line from (236, 130) to (495, 66).
; PLAN: r0=236(x1), r1=130(y1), r2=495(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 130
LDI r2, 495
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
