; DESCRIPTION: Places a blue line segment connecting (352, 31) to (139, 247).
; PLAN: r0=352(x1), r1=31(y1), r2=139(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 31
LDI r2, 139
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
