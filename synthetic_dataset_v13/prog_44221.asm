; DESCRIPTION: Places a purple line segment connecting (251, 177) to (246, 210).
; PLAN: r0=251(x1), r1=177(y1), r2=246(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 177
LDI r2, 246
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
