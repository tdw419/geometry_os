; DESCRIPTION: Places a white line segment connecting (316, 217) to (294, 107).
; PLAN: r0=316(x1), r1=217(y1), r2=294(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 217
LDI r2, 294
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
