; DESCRIPTION: Draws a purple line from (144, 117) to (40, 240).
; PLAN: r0=144(x1), r1=117(y1), r2=40(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 117
LDI r2, 40
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
