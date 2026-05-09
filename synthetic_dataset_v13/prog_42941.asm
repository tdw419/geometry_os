; DESCRIPTION: Places a red line segment connecting (378, 126) to (364, 155).
; PLAN: r0=378(x1), r1=126(y1), r2=364(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 126
LDI r2, 364
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
