; DESCRIPTION: Places a purple line segment connecting (286, 135) to (15, 113).
; PLAN: r0=286(x1), r1=135(y1), r2=15(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 135
LDI r2, 15
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
