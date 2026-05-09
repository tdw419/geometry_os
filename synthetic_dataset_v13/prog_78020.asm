; DESCRIPTION: Renders a purple line between points (187, 191) and (316, 60).
; PLAN: r0=187(x1), r1=191(y1), r2=316(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 191
LDI r2, 316
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
