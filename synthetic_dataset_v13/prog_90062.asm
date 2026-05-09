; DESCRIPTION: Places a purple line segment connecting (71, 28) to (8, 236).
; PLAN: r0=71(x1), r1=28(y1), r2=8(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 28
LDI r2, 8
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
