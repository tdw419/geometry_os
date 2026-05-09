; DESCRIPTION: Places a red line segment connecting (391, 185) to (420, 61).
; PLAN: r0=391(x1), r1=185(y1), r2=420(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 185
LDI r2, 420
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
