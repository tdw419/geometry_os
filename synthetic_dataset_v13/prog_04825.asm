; DESCRIPTION: Places a purple line segment connecting (7, 156) to (184, 236).
; PLAN: r0=7(x1), r1=156(y1), r2=184(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 156
LDI r2, 184
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
