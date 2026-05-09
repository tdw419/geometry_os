; DESCRIPTION: Places a white line segment connecting (316, 134) to (237, 144).
; PLAN: r0=316(x1), r1=134(y1), r2=237(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 134
LDI r2, 237
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
