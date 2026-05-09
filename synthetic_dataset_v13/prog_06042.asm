; DESCRIPTION: Places a purple line segment connecting (67, 247) to (202, 124).
; PLAN: r0=67(x1), r1=247(y1), r2=202(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 247
LDI r2, 202
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
