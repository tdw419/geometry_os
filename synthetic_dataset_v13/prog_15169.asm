; DESCRIPTION: Places a purple line segment connecting (30, 107) to (365, 202).
; PLAN: r0=30(x1), r1=107(y1), r2=365(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 107
LDI r2, 365
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
