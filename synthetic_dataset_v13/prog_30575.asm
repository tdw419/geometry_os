; DESCRIPTION: Places a white line segment connecting (1, 85) to (246, 120).
; PLAN: r0=1(x1), r1=85(y1), r2=246(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 85
LDI r2, 246
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
