; DESCRIPTION: Places a white line segment connecting (23, 172) to (195, 114).
; PLAN: r0=23(x1), r1=172(y1), r2=195(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 172
LDI r2, 195
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
