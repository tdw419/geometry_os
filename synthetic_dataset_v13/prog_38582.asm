; DESCRIPTION: Places a white line segment connecting (426, 70) to (316, 182).
; PLAN: r0=426(x1), r1=70(y1), r2=316(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 70
LDI r2, 316
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
