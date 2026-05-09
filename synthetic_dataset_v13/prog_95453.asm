; DESCRIPTION: Places a purple line segment connecting (125, 166) to (332, 206).
; PLAN: r0=125(x1), r1=166(y1), r2=332(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 166
LDI r2, 332
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
