; DESCRIPTION: Places a purple line segment connecting (394, 7) to (194, 98).
; PLAN: r0=394(x1), r1=7(y1), r2=194(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 7
LDI r2, 194
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
