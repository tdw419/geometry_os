; DESCRIPTION: Places a purple line segment connecting (498, 44) to (352, 99).
; PLAN: r0=498(x1), r1=44(y1), r2=352(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 44
LDI r2, 352
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
