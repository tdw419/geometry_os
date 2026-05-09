; DESCRIPTION: Places a cyan line segment connecting (316, 124) to (489, 191).
; PLAN: r0=316(x1), r1=124(y1), r2=489(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 124
LDI r2, 489
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
