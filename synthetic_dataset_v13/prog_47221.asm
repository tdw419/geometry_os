; DESCRIPTION: Places a green line segment connecting (246, 85) to (57, 75).
; PLAN: r0=246(x1), r1=85(y1), r2=57(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 85
LDI r2, 57
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
