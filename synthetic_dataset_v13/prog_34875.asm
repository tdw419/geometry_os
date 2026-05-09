; DESCRIPTION: Places a purple line segment connecting (266, 166) to (182, 27).
; PLAN: r0=266(x1), r1=166(y1), r2=182(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 166
LDI r2, 182
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
