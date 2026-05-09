; DESCRIPTION: Places a purple line segment connecting (352, 166) to (35, 36).
; PLAN: r0=352(x1), r1=166(y1), r2=35(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 166
LDI r2, 35
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
