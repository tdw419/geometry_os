; DESCRIPTION: Places a white line segment connecting (11, 45) to (246, 4).
; PLAN: r0=11(x1), r1=45(y1), r2=246(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 45
LDI r2, 246
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
