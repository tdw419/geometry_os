; DESCRIPTION: Places a purple line segment connecting (388, 204) to (346, 167).
; PLAN: r0=388(x1), r1=204(y1), r2=346(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 204
LDI r2, 346
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
