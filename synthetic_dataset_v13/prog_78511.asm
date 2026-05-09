; DESCRIPTION: Places a orange line segment connecting (391, 37) to (297, 207).
; PLAN: r0=391(x1), r1=37(y1), r2=297(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 37
LDI r2, 297
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
