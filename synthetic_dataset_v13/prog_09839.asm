; DESCRIPTION: Places a green line segment connecting (253, 67) to (378, 190).
; PLAN: r0=253(x1), r1=67(y1), r2=378(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 67
LDI r2, 378
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
