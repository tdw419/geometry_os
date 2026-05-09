; DESCRIPTION: Places a purple line segment connecting (332, 152) to (361, 212).
; PLAN: r0=332(x1), r1=152(y1), r2=361(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 152
LDI r2, 361
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
