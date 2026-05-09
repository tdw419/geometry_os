; DESCRIPTION: Places a purple line segment connecting (365, 134) to (166, 53).
; PLAN: r0=365(x1), r1=134(y1), r2=166(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 134
LDI r2, 166
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
