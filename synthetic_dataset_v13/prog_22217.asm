; DESCRIPTION: Draws a purple line from (495, 14) to (98, 18).
; PLAN: r0=495(x1), r1=14(y1), r2=98(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 14
LDI r2, 98
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
