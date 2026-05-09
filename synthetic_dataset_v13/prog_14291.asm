; DESCRIPTION: Places a white line segment connecting (15, 140) to (252, 246).
; PLAN: r0=15(x1), r1=140(y1), r2=252(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 140
LDI r2, 252
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
