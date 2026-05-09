; DESCRIPTION: Places a red line segment connecting (319, 90) to (367, 183).
; PLAN: r0=319(x1), r1=90(y1), r2=367(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 90
LDI r2, 367
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
