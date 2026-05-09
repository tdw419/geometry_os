; DESCRIPTION: Places a purple line segment connecting (111, 166) to (145, 186).
; PLAN: r0=111(x1), r1=166(y1), r2=145(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 166
LDI r2, 145
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
