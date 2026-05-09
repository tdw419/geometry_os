; DESCRIPTION: Places a purple line segment connecting (49, 143) to (297, 125).
; PLAN: r0=49(x1), r1=143(y1), r2=297(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 143
LDI r2, 297
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
