; DESCRIPTION: Places a red line segment connecting (378, 198) to (450, 11).
; PLAN: r0=378(x1), r1=198(y1), r2=450(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 198
LDI r2, 450
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
