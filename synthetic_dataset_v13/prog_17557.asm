; DESCRIPTION: Places a red line segment connecting (213, 3) to (47, 247).
; PLAN: r0=213(x1), r1=3(y1), r2=47(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 3
LDI r2, 47
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
