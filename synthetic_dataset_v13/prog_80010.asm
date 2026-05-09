; DESCRIPTION: Places a purple line segment connecting (275, 95) to (229, 183).
; PLAN: r0=275(x1), r1=95(y1), r2=229(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 95
LDI r2, 229
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
