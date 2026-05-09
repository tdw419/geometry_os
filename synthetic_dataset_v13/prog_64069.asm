; DESCRIPTION: Places a purple line segment connecting (469, 194) to (393, 57).
; PLAN: r0=469(x1), r1=194(y1), r2=393(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 194
LDI r2, 393
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
