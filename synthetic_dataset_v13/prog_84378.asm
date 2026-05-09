; DESCRIPTION: Places a purple line segment connecting (352, 194) to (460, 66).
; PLAN: r0=352(x1), r1=194(y1), r2=460(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 194
LDI r2, 460
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
