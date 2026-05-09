; DESCRIPTION: Places a cyan line segment connecting (80, 61) to (316, 202).
; PLAN: r0=80(x1), r1=61(y1), r2=316(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 61
LDI r2, 316
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
