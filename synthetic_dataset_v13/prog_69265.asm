; DESCRIPTION: Places a white line segment connecting (427, 39) to (493, 201).
; PLAN: r0=427(x1), r1=39(y1), r2=493(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 39
LDI r2, 493
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
