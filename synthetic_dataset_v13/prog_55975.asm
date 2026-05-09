; DESCRIPTION: Places a white line segment connecting (276, 245) to (200, 182).
; PLAN: r0=276(x1), r1=245(y1), r2=200(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 245
LDI r2, 200
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
